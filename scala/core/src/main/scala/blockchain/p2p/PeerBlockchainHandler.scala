package blockchain.p2p

import blockchain.consensus.ChainSelectionOutcome
import blockchain.ledger.TransactionValidationContext
import blockchain.codecs.given
import blockchain.models.*
import blockchain.ledger.*
import blockchain.*
import cats.data.OptionT
import cats.effect.Async
import cats.implicits.*
import cats.effect.implicits.*
import com.google.protobuf.ByteString
import fs2.Stream
import org.typelevel.log4cats.Logger
import scala.concurrent.duration.*

class PeerBlockchainHandler[F[_]: Async: Logger](
    core: BlockchainCore[F],
    interface: PeerBlockchainInterface[F],
    remotePeerState: PeerState[F]
):
  def handle: Stream[F, Unit] =
    pingPong.merge(peerState).mergeHaltR(start)

  private def pingPong =
    Stream
      .awakeEvery(5.seconds)
      .evalMap(_ => interface.ping(ByteString.EMPTY))
      .void

  private def peerState =
    Stream
      .awakeEvery(30.seconds)
      .evalMap(_ => interface.publicState)
      .evalMap(remotePeerState.publicStateRef.set)
      .void

  private def start = verifyGenesisAgreement ++ syncCheck

  private def verifyGenesisAgreement: Stream[F, Unit] =
    Stream.exec(
      for {
        remoteGenesisId <- OptionT(interface.blockIdAtHeight(Genesis.Height))
          .getOrRaise(new IllegalArgumentException("No Genesis"))
        localGenesisId <- core.consensus.localChain.genesis
        _ <- Async[F].raiseWhen(remoteGenesisId != localGenesisId)(
          new IllegalArgumentException("Genesis Mismatch")
        )
      } yield ()
    )

  private def syncCheck: Stream[F, Unit] =
    Stream.force(
      for {
        commonAncestorId <- interface.commonAncestor
        remoteHeadId <- OptionT(interface.blockIdAtHeight(0))
          .getOrRaise(new IllegalArgumentException("No Canonical Head"))
        remoteHeader <- OptionT(interface.fetchHeader(remoteHeadId))
          .getOrRaise(new IllegalArgumentException("No Canonical Head"))
        remoteHeaderAtHeightF = (height: Height) =>
          OptionT(interface.blockIdAtHeight(height)).flatMapF(interface.fetchHeader).value
        commonAncestorHeader <- core.dataStores.headers.getOrRaise(commonAncestorId)
        localHeadId <- core.consensus.localChain.currentHead
        localHeader <- core.dataStores.headers.getOrRaise(localHeadId)
        localHeaderAtHeightF = (height: Height) =>
          OptionT(core.consensus.localChain.blockIdAtHeight(height)).flatMapF(core.dataStores.headers.get).value
        chainSelectionResult <- core.consensus.chainSelection.compare(
          localHeader,
          remoteHeader,
          commonAncestorHeader,
          localHeaderAtHeightF,
          remoteHeaderAtHeightF
        )
        nextOperation <- chainSelectionResult match {
          case ChainSelectionOutcome.XStandard =>
            Logger[F].info("Remote peer is up-to-date but local chain is better") >>
              waitForBetterBlock.pure[F]
          case ChainSelectionOutcome.YStandard =>
            Logger[F].info("Local peer is up-to-date but remote chain is better") >>
              sync(commonAncestorHeader).pure[F]
          case ChainSelectionOutcome.XDensity =>
            Logger[F].info("Remote peer is out-of-sync but local chain is better") >>
              waitForBetterBlock.pure[F]
          case ChainSelectionOutcome.YDensity =>
            Logger[F].info("Local peer out-of-sync and remote chain is better") >>
              sync(commonAncestorHeader).pure[F]
        }
      } yield nextOperation
    )

  private def waitForBetterBlock: Stream[F, Unit] =
    Stream.force(
      interface.nextBlockAdoption.flatMap(blockId =>
        Logger[F].info(show"Received block notification id=$blockId") >>
          core.dataStores.headers
            .contains(blockId)
            .ifM(
              Logger[F].info(show"Ignoring known block id=$blockId") >>
                waitForBetterBlock.pure[F],
              OptionT(interface.fetchHeader(blockId))
                .getOrRaise(new IllegalArgumentException("Remote header not found"))
                .flatMap(remoteHeader =>
                  core.consensus.localChain.currentHead.flatMap(currentHeadId =>
                    if (remoteHeader.parentHeaderId == currentHeadId)
                      fetchVerifyPersist(remoteHeader)
                        .flatTap(adoptAndLog) >>
                        waitForBetterBlock.pure[F]
                    else
                      Logger[F].info(show"Block id=$blockId is not a direct local extension.  Checking sync.") >>
                        syncCheck.pure[F]
                  )
                )
            )
      )
    )

  private def sync(commonAncestor: BlockHeader): Stream[F, Unit] =
    Stream
      .eval(
        (commonAncestor.height + 1, none[FullBlock])
          .tailRecM((h, lastProcessed) =>
            OptionT(interface.blockIdAtHeight(h))
              .semiflatMap(remoteId =>
                OptionT(interface.fetchHeader(remoteId))
                  .getOrRaise(new IllegalArgumentException("Remote header not found"))
                  .ensure(new IllegalStateException("Remote peer branched during syncing"))(header =>
                    lastProcessed.forall(_.header.id == header.parentHeaderId)
                  )
                  .flatMap(fetchVerifyPersist)
                  .map(_.some)
                  .tupleLeft(h + 1)
              )
              .flatTapNone(lastProcessed.traverse(adoptAndLog))
              .toLeft(lastProcessed)
              .value
          )
      )
      .evalTap(_.traverse(adoptAndLog))
      .void ++ waitForBetterBlock

  private def fetchVerifyPersist(header: BlockHeader): F[FullBlock] =
    for {
      _ <- Logger[F].info(show"Processing remote block id=${header.id}")
      _ <- core.consensus.headerValidation
        .validate(header)
        .leftMap(errors => new IllegalArgumentException(errors.head))
        .rethrowT
      _ <- core.dataStores.headers.put(header.id, header)
      parentHeader <- core.dataStores.headers.getOrRaise(header.parentHeaderId)
      _ <- core.blockIdTree.associate(header.id, header.parentHeaderId)
      body <- OptionT(core.dataStores.bodies.get(header.id))
        .orElse(
          OptionT(interface.fetchBody(header.id))
            .ensure(new IllegalArgumentException("TxRoot Mismatch"))(body =>
              body.transactionIds.txRoot(parentHeader.txRoot) == header.txRoot
            )
        )
        .getOrRaise(new IllegalArgumentException("Remote body not found"))
      transactions <- body.transactionIds.traverse(id =>
        OptionT(core.dataStores.transactions.get(id))
          .orElse(OptionT(interface.fetchTransaction(id)))
          .getOrRaise(new IllegalArgumentException("Remote transaction not found"))
      )
      fullBody = FullBlockBody(transactions)
      _ <- core.ledger.bodyValidation
        .validate(
          fullBody,
          TransactionValidationContext(
            header.parentHeaderId,
            header.height,
            header.slot
          )
        )
        .leftMap(errors => new IllegalArgumentException(errors.head))
        .rethrowT
      _ <- core.dataStores.bodies.contains(header.id).ifM(().pure[F], core.dataStores.bodies.put(header.id, body))
      _ <- transactions.traverseTap(transaction =>
        core.dataStores.transactions
          .contains(transaction.id)
          .ifM(().pure[F], core.dataStores.transactions.put(transaction.id, transaction))
      )
    } yield FullBlock(header, fullBody)

  private def adoptAndLog(fullBlock: FullBlock): F[Unit] =
    core.consensus.localChain.adopt(fullBlock.header.id) >>
      Logger[F].info(
        show"Adopted block" +
          show" id=${fullBlock.header.id}" +
          show" height=${fullBlock.header.height}" +
          show" slot=${fullBlock.header.slot}" +
          show" transactions=${fullBlock.fullBody.transactions.map(_.id)}"
      )
