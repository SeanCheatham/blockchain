package com.giraffechain.p2p

import cats.data.OptionT
import cats.effect.implicits.*
import cats.effect.std.{Mutex, Random}
import cats.effect.{Async, Fiber, Ref, Resource}
import cats.implicits.*
import com.giraffechain.codecs.given
import com.giraffechain.consensus.ChainSelectionOutcome
import com.giraffechain.models.*
import com.giraffechain.{BlockchainCore, Height}
import fs2.{Chunk, Pipe, Pull, Stream}
import org.typelevel.log4cats.Logger
import org.typelevel.log4cats.slf4j.Slf4jLogger

class SharedSync[F[_]: Async: Random](
    core: BlockchainCore[F],
    clientsF: F[Map[PeerId, PeerBlockchainInterface[F]]],
    stateRef: Ref[F, Option[SharedSyncState[F]]],
    mutex: Mutex[F]
):

  private given logger: Logger[F] =
    Slf4jLogger.getLoggerFromName("SharedSync")

  /** Compares the new target against the current target. If better than the current target, syncing will begin against
    * the new target
    * @param commonAncestorHeader
    *   The local common ancestor
    * @param target
    *   The block adopted by the remote peer
    * @param peerId
    *   The peer that adopted the block
    * @return
    *   Unit, once the comparison is complete. Does not wait for synchronization.
    */
  def compare(commonAncestorHeader: BlockHeader, target: BlockHeader, peerId: PeerId): F[Unit] =
    mutex.lock
      .surround(
        OptionT(stateRef.get).foldF(
          localCompare(commonAncestorHeader, target, peerId)
        )(state =>
          if (state.target.id == target.id || state.target.id == target.parentHeaderId)
            updateTarget(commonAncestorHeader, target, peerId).void
          else remoteCompare(target, peerId)(state.target, state.providers)
        )
      )

  /** Removes the peer from any sync processes. If the peer was the only provider, syncing stops until a new comparison
    * is made.
    * @param peerId
    *   The peer to omit
    */
  def omitPeer(peerId: PeerId): F[Unit] =
    stateRef.modify {
      case Some(state) if state.providers == Set(peerId) =>
        (none, Logger[F].info("Canceling sync due to no remaining peers.") >> state.fiber.cancel)
      case Some(state) if state.providers.contains(peerId) =>
        (state.copy(providers = state.providers - peerId).some, ().pure[F])
      case s =>
        (s, ().pure[F])
    }.flatten

  def syncCompletion: F[Unit] =
    OptionT(stateRef.get).foldF(().pure[F])(_.fiber.joinWithUnit)

  private def localCompare(commonAncestorHeader: BlockHeader, target: BlockHeader, peerId: PeerId) =
    for {
      interface <- clientsF.map(_.apply(peerId))
      remoteHeaderAtHeightF = (height: Height) =>
        OptionT(interface.blockIdAtHeight(height)).flatMapF(interface.fetchHeader).value
      localHeadId <- core.consensus.localChain.currentHead
      localHeader <- core.dataStores.headers.getOrRaise(localHeadId)
      localHeaderAtHeightF = (height: Height) =>
        OptionT(core.consensus.localChain.blockIdAtHeight(height)).flatMapF(core.dataStores.headers.get).value
      chainSelectionResult <- core.consensus.chainSelection.compare(
        localHeader,
        target,
        commonAncestorHeader,
        localHeaderAtHeightF,
        remoteHeaderAtHeightF
      )
      _ <- logResult(chainSelectionResult)
      _ <- Async[F].whenA(chainSelectionResult.isY)(updateTarget(commonAncestorHeader, target, peerId))
    } yield ()

  private def remoteCompare(target: BlockHeader, peerId: PeerId)(
      currentTarget: BlockHeader,
      providers: Set[PeerId]
  ) =
    for {
      clients <- clientsF
      interface = clients(peerId)
      remoteHeaderAtHeightF = (height: Height) =>
        OptionT(interface.blockIdAtHeight(height)).flatMapF(interface.fetchHeader).value
      pseudoLocalInterface <- SortedPeerInterface.make(providers.map(clients).toList)
      localHeaderAtHeightF = (height: Height) =>
        OptionT(pseudoLocalInterface.blockIdAtHeight(height)).flatMapF(pseudoLocalInterface.fetchHeader).value
      commonAncestor <- interface.remoteCommonAncestor(pseudoLocalInterface)
      commonAncestorHeader <- OptionT(pseudoLocalInterface.fetchHeader(commonAncestor))
        .getOrRaise(new IllegalArgumentException("Remote header not found"))
      chainSelectionResult <- core.consensus.chainSelection.compare(
        currentTarget,
        target,
        commonAncestorHeader,
        localHeaderAtHeightF,
        remoteHeaderAtHeightF
      )
      _ <- logResult(chainSelectionResult)
      _ <- Async[F].whenA(chainSelectionResult.isY)(updateTarget(commonAncestorHeader, target, peerId))
    } yield ()

  private def logResult(chainSelectionResult: ChainSelectionOutcome) =
    chainSelectionResult match {
      case ChainSelectionOutcome.XStandard =>
        Logger[F].info("Remote peer is up-to-date but local chain is better")
      case ChainSelectionOutcome.YStandard =>
        Logger[F].info("Local peer is up-to-date but remote chain is better")
      case ChainSelectionOutcome.XDensity =>
        Logger[F].info("Remote peer is out-of-sync but local chain is better")
      case ChainSelectionOutcome.YDensity =>
        Logger[F].info("Local peer out-of-sync and remote chain is better")
    }

  private def updateTarget(commonAncestor: BlockHeader, target: BlockHeader, provider: PeerId): F[SharedSyncState[F]] =
    stateRef.get
      .flatMap {
        case Some(s @ SharedSyncState(current, providers, _)) if current.id == target.id =>
          s.copy(providers = providers + provider).pure[F]
        case Some(s @ SharedSyncState(current, _, _)) if current.id == target.parentHeaderId =>
          s.copy(target = target, providers = Set(provider)).pure[F]
        case Some(SharedSyncState(_, _, fiber)) =>
          fiber.cancel >>
            sync(commonAncestor, target).start.map(fiber => SharedSyncState(target, Set(provider), fiber))
        case _ =>
          sync(commonAncestor, target).start
            .map(fiber => SharedSyncState(target, Set(provider), fiber))
      }
      .flatTap(state => stateRef.set(state.some))

  private def sync(commonAncestor: BlockHeader, initialTarget: BlockHeader): F[Unit] =
    (Stream.range(commonAncestor.height + 1, initialTarget.height + 1) ++ Stream
      .eval(OptionT(stateRef.get).map(_.target.height).value)
      .flatMap(Stream.fromOption[F](_))
      .flatMap(max => Stream.range(initialTarget.height + 1, max + 1)))
      .chunkN(512)
      .flatMap(syncHeights(_))
      .through(adoptSparsely)
      .compile
      .drain
      .onError(e => Logger[F].error(e)("Sync failed"))
      .guaranteeCase(o => Async[F].unlessA(o.isCanceled)(stateRef.set(none)))

  private def syncHeights(heights: Chunk[Long], retries: Int = 3): Stream[F, FullBlock] =
    Stream
      .eval(interfaceForHeight(heights.last.get))
      .flatMap((interface, parallelismScale) =>
        Stream
          .chunk(heights)
          .parEvalMap(16 * parallelismScale)(height =>
            OptionT(interface.blockIdAtHeight(height)).getOrRaise(
              new IllegalStateException("Block at height not found")
            )
          )
          .parEvalMap(32 * parallelismScale)(id =>
            OptionT(core.dataStores.headers.get(id))
              .orElseF(interface.fetchHeader(id))
              .getOrRaise(new IllegalArgumentException("Remote header not found"))
          )
          .through(noForks)
          .through(fetchVerifyPersistPipe(interface, parallelismScale))
      )
      .recoverWith {
        case e if retries > 0 =>
          Stream.eval(Logger[F].warn(e)("Sync failed. Retrying partial.")) >> syncHeights(heights, retries - 1)
      }

  private def interfaceForHeight(height: Height) =
    for {
      clients <- clientsF
      SharedSyncState(_, providers, _) <- OptionT(stateRef.get).getOrRaise(
        new IllegalStateException("Target not set")
      )
      providerInterfaces = providers.map(clients).toList
      providersInterface <- SortedPeerInterface.make[F](providerInterfaces)
      batchTargetId <- OptionT(providersInterface.blockIdAtHeight(height)).getOrRaise(
        new IllegalStateException("Target not found")
      )
      alternativeClients <- (clients -- providers).values.toList.traverseFilter(client =>
        OptionT(client.blockIdAtHeight(height)).filter(_ == batchTargetId).as(client).value
      )
      interface <- SortedPeerInterface.make(providerInterfaces ++ alternativeClients)
      parallelismScale = providerInterfaces.length + alternativeClients.length
    } yield (interface, parallelismScale)

  private def fetchVerifyPersistPipe(
      interface: PeerBlockchainInterface[F],
      parallelismScale: Int
  ): Pipe[F, BlockHeader, FullBlock] =
    _.evalTap(PeerBlockchainHandler.checkHeader(core))
      .parEvalMap(32 * parallelismScale)(PeerBlockchainHandler.fetchFullBlock(core, interface, parallelismScale))
      .evalTap(PeerBlockchainHandler.checkBody(core))

  private def noForks: Pipe[F, BlockHeader, BlockHeader] = {
    def start(s: Stream[F, BlockHeader]): Pull[F, BlockHeader, Unit] =
      s.pull.uncons1.flatMap {
        case Some((head, tail)) =>
          Pull.output1(head) >> go(tail, head)
        case None =>
          Pull.done
      }

    def go(
        s: Stream[F, BlockHeader],
        previous: BlockHeader
    ): Pull[F, BlockHeader, Unit] =
      s.pull.uncons1.flatMap {
        case Some((head, tlStream)) =>
          if (head.parentHeaderId != previous.id)
            Pull.raiseError(new IllegalStateException("Remote peer branched during sync"))
          else Pull.output1(head) >> go(tlStream, head)
        case None =>
          Pull.done
      }

    start(_).stream
  }

  private def adoptSparsely: Pipe[F, FullBlock, FullBlock] = {
    val epochThirdLength = core.clock.epochLength / 3L
    def start(s: Stream[F, FullBlock]): Pull[F, FullBlock, Unit] =
      s.pull.uncons1.flatMap {
        case Some((head, tail)) =>
          Pull.output1(head) >> go(tail, head, false, head.header.slot / epochThirdLength)
        case None =>
          Pull.done
      }

    def go(
        s: Stream[F, FullBlock],
        previous: FullBlock,
        previousWasAdopted: Boolean,
        lastAdoptedThird: Long
    ): Pull[F, FullBlock, Unit] =
      s.pull.uncons1.flatMap {
        case Some((head, tail)) =>
          val third = head.header.slot / epochThirdLength
          if (third != lastAdoptedThird)
            Pull.eval(core.consensus.localChain.adopt(head.header.id)) >>
              Pull.output1(head) >> go(tail, head, true, third)
          else
            Pull.output1(head) >> go(tail, head, false, lastAdoptedThird)
        case None =>
          if (previousWasAdopted) Pull.done
          else Pull.eval(core.consensus.localChain.adopt(previous.header.id)) >> Pull.done
      }

    start(_).stream
  }

object SharedSync:
  def make[F[_]: Async: Random](
      core: BlockchainCore[F],
      clientsF: F[Map[PeerId, PeerBlockchainInterface[F]]]
  ): Resource[F, SharedSync[F]] =
    (
      Resource.make(Ref.of[F, Option[SharedSyncState[F]]](None))(
        _.getAndSet(none).flatMap(_.traverse(_.fiber.cancel)).void
      ),
      Mutex[F].toResource
    )
      .mapN(new SharedSync(core, clientsF, _, _))

case class SharedSyncState[F[_]](target: BlockHeader, providers: Set[PeerId], fiber: Fiber[F, Throwable, Unit])
