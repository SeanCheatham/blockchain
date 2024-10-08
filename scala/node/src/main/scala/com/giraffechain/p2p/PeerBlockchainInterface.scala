package com.giraffechain.p2p

import cats.data.OptionT
import cats.effect.implicits.*
import cats.effect.kernel.Resource
import cats.effect.std.Queue
import cats.effect.{Async, Ref}
import cats.implicits.*
import com.giraffechain.codecs.{Codecs, P2PEncodable, given}
import com.giraffechain.ledger.MempoolChange
import com.giraffechain.models.*
import com.giraffechain.utility.Ratio
import com.giraffechain.{BlockchainCore, Bytes, Height}
import fs2.Stream
import org.typelevel.log4cats.Logger

import scala.collection.immutable.SortedSet
import scala.concurrent.duration.*

trait PeerBlockchainInterface[F[_]]:
  def publicState: F[PublicP2PState]
  def nextBlockAdoption: F[BlockId]
  def nextTransactionNotification: F[TransactionId]
  def fetchHeader(id: BlockId): F[Option[BlockHeader]]
  def fetchBody(id: BlockId): F[Option[BlockBody]]
  def fetchTransaction(id: TransactionId): F[Option[Transaction]]
  def blockIdAtHeight(height: Height): F[Option[BlockId]]
  def ping(message: Bytes): F[Bytes]
  def commonAncestor: F[BlockId]
  def background: Stream[F, Unit]

  def remoteCommonAncestor(altInterface: PeerBlockchainInterface[F])(using Async[F]): F[BlockId] =
    for {
      _ <- ().pure[F]
      getLocalBlockIdAtHeight = (height: Height) =>
        OptionT(altInterface.blockIdAtHeight(height))
          .getOrRaise(new IllegalStateException("Pseudo-local height not found"))
          .localTimeout("BlockIdAtHeight.CommonAncestor")
      localHeadId <- getLocalBlockIdAtHeight(0)
      localHeader <-
        OptionT(altInterface.fetchHeader(localHeadId))
          .getOrRaise(new IllegalStateException("Pseudo-local header not found"))
          .localTimeout("BlockIdAtHeight.CommonAncestor")
      intersection <-
        OptionT(quickSearch(getLocalBlockIdAtHeight, blockIdAtHeight, 5, localHeader.height))
          .orElse(
            OptionT(narySearch(getLocalBlockIdAtHeight, blockIdAtHeight, Ratio(2, 3))(1L, localHeader.height))
          )
          .getOrRaise(new IllegalStateException("Common ancestor not found"))
          .timeoutWithMessage(30.seconds, "Common ancestor trace")
    } yield intersection

class PeerBlockchainInterfaceImpl[F[_]: Async: Logger](
    core: BlockchainCore[F],
    manager: PeersManager[F],
    allPortQueues: AllPortQueues[F],
    readerWriter: MultiplexedReaderWriter[F],
    cache: PeerCache[F]
) extends PeerBlockchainInterface[F]:
  def publicState: F[PublicP2PState] =
    writeRequest(MultiplexerIds.PeerStateRequest, (), allPortQueues.p2pState)
  def nextBlockAdoption: F[BlockId] =
    cache.remoteBlockAdoptions.take
  def nextTransactionNotification: F[TransactionId] =
    cache.remoteTransactionAdoptions.take
  def fetchHeader(id: BlockId): F[Option[BlockHeader]] =
    OptionT(writeRequest(MultiplexerIds.HeaderRequest, id, allPortQueues.headers))
      .map(_.withEmbeddedId)
      .ensure(new IllegalArgumentException("Header ID Mismatch"))(_.id == id)
      .value
  def fetchBody(id: BlockId): F[Option[BlockBody]] =
    writeRequest(MultiplexerIds.BodyRequest, id, allPortQueues.bodies)
  def fetchTransaction(id: TransactionId): F[Option[Transaction]] =
    OptionT(writeRequest(MultiplexerIds.TransactionRequest, id, allPortQueues.transactions))
      .map(_.withEmbeddedId)
      .ensure(new IllegalArgumentException("Transaction ID Mismatch"))(_.id == id)
      .value
  def blockIdAtHeight(height: Height): F[Option[BlockId]] =
    writeRequest(MultiplexerIds.BlockIdAtHeightRequest, height, allPortQueues.blockIdAtHeight)
  def ping(message: Bytes): F[Bytes] =
    writeRequest(MultiplexerIds.PingRequest, message, allPortQueues.pingPong).ensure(
      new IllegalArgumentException("Invalid PingPong Response")
    )(_ == message)

  def commonAncestor: F[BlockId] =
    for {
      localHeadId <- core.consensus.localChain.currentHead
      localHeader <- core.dataStores.headers.getOrRaise(localHeadId)
      getLocalBlockIdAtHeight = (height: Height) =>
        OptionT(core.consensus.localChain.blockIdAtHeight(height))
          .getOrRaise(new IllegalStateException("Local height not found"))
          .localTimeout("BlockIdAtHeight.CommonAncestor")
      intersection <-
        OptionT(quickSearch(getLocalBlockIdAtHeight, blockIdAtHeight, 5, localHeader.height))
          .orElse(
            OptionT(narySearch(getLocalBlockIdAtHeight, blockIdAtHeight, Ratio(2, 3))(1L, localHeader.height))
          )
          .getOrRaise(new IllegalStateException("Common ancestor not found"))
          .timeoutWithMessage(30.seconds, "Common ancestor trace")
    } yield intersection

  def background: Stream[F, Unit] =
    readerStream.merge(portQueueStreams).merge(cacheStreams)

  private def readerStream =
    readerWriter.read
      .evalMap((port, bytes) =>
        if (bytes.size() == 0)
          Async[F]
            .raiseError(new IllegalArgumentException("Not RequestResponse"))
        else
          bytes.byteAt(0) match {
            case 0 => processRequest(port, bytes.substring(1))
            case 1 => processResponse(port, bytes.substring(1))
            case _ =>
              Async[F]
                .raiseError(new IllegalArgumentException("Not RequestResponse"))
          }
      )

  private def portQueueStreams =
    Stream(
      allPortQueues.blockIdAtHeight.backgroundRequestProcessor(onPeerRequestedBlockIdAtHeight),
      allPortQueues.headers.backgroundRequestProcessor(onPeerRequestedHeader),
      allPortQueues.bodies.backgroundRequestProcessor(onPeerRequestedBody),
      allPortQueues.transactions.backgroundRequestProcessor(onPeerRequestedTransaction),
      allPortQueues.blockAdoptions.backgroundRequestProcessor(_ => onPeerRequestedBlockNotification()),
      allPortQueues.transactionAdoptions.backgroundRequestProcessor(_ => onPeerRequestedTransactionNotification()),
      allPortQueues.p2pState.backgroundRequestProcessor(_ => onPeerRequestedState()),
      allPortQueues.pingPong.backgroundRequestProcessor(onPeerRequestedPing)
    ).parJoinUnbounded

  private def cacheStreams =
    Stream(
      core.consensus.localChain.adoptions
        .evalMap(
          cache.localBlockAdoptions
            .tryOffer(_)
            .flatMap(
              Async[F].raiseUnless(_)(new IllegalStateException("Slow peer subscriber of local block adoptions"))
            )
        )
        .void,
      core.ledger.mempool.changes
        .collect { case MempoolChange.Added(transaction) => transaction.id }
        .evalMap(
          cache.localTransactionAdoptions
            .tryOffer(_)
            .flatMap(
              Async[F]
                .raiseUnless(_)(new IllegalStateException("Slow peer subscriber of local transaction notifications"))
            )
        )
        .void,
      Stream
        .repeatEval(
          writeRequestNoTimeout(MultiplexerIds.BlockAdoptionRequest, (), allPortQueues.blockAdoptions)
        )
        .evalMap(
          cache.remoteBlockAdoptions
            .tryOffer(_)
            .flatMap(
              Async[F].raiseUnless(_)(new IllegalStateException("Slow local subscriber of peer block adoptions"))
            )
        ),
      Stream
        .repeatEval(
          writeRequestNoTimeout(MultiplexerIds.TransactionNotificationRequest, (), allPortQueues.transactionAdoptions)
        )
        .evalMap(
          cache.remoteTransactionAdoptions
            .tryOffer(_)
            .flatMap(
              Async[F]
                .raiseUnless(_)(new IllegalStateException("Slow local subscriber of peer transaction notifications"))
            )
        )
    ).parJoinUnbounded

  private def processRequest(port: Int, data: Bytes) =
    // TODO: Should these semantically block? Or just return immediately?
    port match {
      case MultiplexerIds.BlockIdAtHeightRequest =>
        allPortQueues.blockIdAtHeight.processRequest(data)
      case MultiplexerIds.HeaderRequest =>
        allPortQueues.headers.processRequest(data)
      case MultiplexerIds.BodyRequest =>
        allPortQueues.bodies.processRequest(data)
      case MultiplexerIds.BlockAdoptionRequest =>
        allPortQueues.blockAdoptions.processRequest(())
      case MultiplexerIds.TransactionRequest =>
        allPortQueues.transactions.processRequest(data)
      case MultiplexerIds.TransactionNotificationRequest =>
        allPortQueues.transactionAdoptions.processRequest(())
      case MultiplexerIds.PeerStateRequest =>
        allPortQueues.p2pState.processRequest(())
      case MultiplexerIds.PingRequest =>
        allPortQueues.pingPong.processRequest(data)
      case _ =>
        Async[F].raiseError(new IllegalArgumentException(s"Invalid port=$port"))
    }

  private def processResponse(port: Int, data: Bytes): F[Unit] =
    port match {
      case MultiplexerIds.BlockIdAtHeightRequest =>
        allPortQueues.blockIdAtHeight.processResponse(data)
      case MultiplexerIds.HeaderRequest =>
        allPortQueues.headers.processResponse(data)
      case MultiplexerIds.BodyRequest =>
        allPortQueues.bodies.processResponse(data)
      case MultiplexerIds.BlockAdoptionRequest =>
        allPortQueues.blockAdoptions.processResponse(data)
      case MultiplexerIds.TransactionRequest =>
        allPortQueues.transactions.processResponse(data)
      case MultiplexerIds.TransactionNotificationRequest =>
        allPortQueues.transactionAdoptions.processResponse(data)
      case MultiplexerIds.PeerStateRequest =>
        allPortQueues.p2pState.processResponse(data)
      case MultiplexerIds.PingRequest =>
        allPortQueues.pingPong.processResponse(data)
      case _ =>
        Async[F].raiseError(new IllegalArgumentException(s"Invalid port=$port"))
    }

  private def writeRequest[Message: P2PEncodable, Response](
      port: Int,
      message: Message,
      buffer: PortQueues[F, Message, Response]
  ): F[Response] =
    writeRequestNoTimeout(port, message, buffer)
      .timeoutWithMessage(DefaultReadTimeout, s"Request timeout in port=$port")

  private def writeRequestNoTimeout[Message: P2PEncodable, Response](
      port: Int,
      message: Message,
      buffer: PortQueues[F, Message, Response]
  ): F[Response] =
    buffer.expectResponse(
      readerWriter.write(port, Codecs.ZeroBS.concat(P2PEncodable[Message].encodeP2P(message)))
    )

  private def writeResponse[Message: P2PEncodable](
      port: Int,
      message: Message
  ): F[Unit] =
    readerWriter.write(port, Codecs.OneBS.concat(P2PEncodable[Message].encodeP2P(message)))

  private def onPeerRequestedBlockIdAtHeight(height: Height) =
    core.consensus.localChain
      .blockIdAtHeight(height)
      .localTimeout("BlockIdAtHeight")
      .flatMap(writeResponse(MultiplexerIds.BlockIdAtHeightRequest, _))

  private def onPeerRequestedHeader(id: BlockId) =
    core.dataStores.headers
      .get(id)
      .localTimeout("GetHeader")
      .flatMap(writeResponse(MultiplexerIds.HeaderRequest, _))

  private def onPeerRequestedBody(id: BlockId) =
    core.dataStores.bodies
      .get(id)
      .localTimeout("GetBody")
      .flatMap(writeResponse(MultiplexerIds.BodyRequest, _))

  private def onPeerRequestedTransaction(id: TransactionId) =
    core.dataStores.transactions
      .get(id)
      .localTimeout("GetTransaction")
      .flatMap(writeResponse(MultiplexerIds.TransactionRequest, _))

  private def onPeerRequestedState() =
    manager.currentState
      .localTimeout("PeerState")
      .flatMap(
        writeResponse(MultiplexerIds.PeerStateRequest, _)
      )

  private def onPeerRequestedPing(message: Bytes) =
    writeResponse(MultiplexerIds.PingRequest, message)

  private def onPeerRequestedBlockNotification() =
    cache.localBlockAdoptions.take
      .flatMap(writeResponse(MultiplexerIds.BlockAdoptionRequest, _))

  private def onPeerRequestedTransactionNotification() =
    cache.localTransactionAdoptions.take
      .flatMap(writeResponse(MultiplexerIds.TransactionNotificationRequest, _))

class PeerCache[F[_]](
    val localBlockAdoptions: Queue[F, BlockId],
    val localTransactionAdoptions: Queue[F, TransactionId],
    val remoteBlockAdoptions: Queue[F, BlockId],
    val remoteTransactionAdoptions: Queue[F, TransactionId]
)
object PeerCache:
  def make[F[_]: Async]: Resource[F, PeerCache[F]] =
    (
      Queue.bounded[F, BlockId](64),
      Queue.bounded[F, TransactionId](64),
      Queue.bounded[F, BlockId](64),
      Queue.bounded[F, TransactionId](64)
    )
      .mapN(new PeerCache[F](_, _, _, _))
      .toResource

class SortedPeerInterface[F[_]: Async](interfacesRef: Ref[F, SortedSet[(Int, PeerBlockchainInterface[F])]])
    extends PeerBlockchainInterface[F]:
  import SortedPeerInterface.*
  // Increments the "pending request counter" of the interface with the least pending requests
  // Upon completion, decrements that interfaces request counter
  private def interface = Resource.make(interfacesRef.modify { s =>
    val (count, interface) = s.head
    (SortedSet.from(s.tail) + ((count + 1, interface)), interface)
  })(interface =>
    interfacesRef.update { s =>
      val (x, y) = s.partition(_._2 == interface)
      SortedSet.from(x.map(t => (t._1 - 1, t._2))) ++ y
    }
  )
  def publicState: F[PublicP2PState] = interface.use(_.publicState)
  def nextBlockAdoption: F[BlockId] = interface.use(_.nextBlockAdoption)
  def nextTransactionNotification: F[TransactionId] = interface.use(_.nextTransactionNotification)
  def fetchHeader(id: BlockId): F[Option[BlockHeader]] = interface.use(_.fetchHeader(id))
  def fetchBody(id: BlockId): F[Option[BlockBody]] = interface.use(_.fetchBody(id))
  def fetchTransaction(id: TransactionId): F[Option[Transaction]] = interface.use(_.fetchTransaction(id))
  def blockIdAtHeight(height: Height): F[Option[BlockId]] = interface.use(_.blockIdAtHeight(height))
  def ping(message: Bytes): F[Bytes] = interface.use(_.ping(message))
  def commonAncestor: F[BlockId] = interface.use(_.commonAncestor)
  def background: Stream[F, Unit] =
    Stream.raiseError(new IllegalAccessException("MultiPeerInterface does not support background"))

object SortedPeerInterface:
  def make[F[_]: Async](interfaces: Iterable[PeerBlockchainInterface[F]]): F[PeerBlockchainInterface[F]] =
    if (interfaces.size == 1) interfaces.head.pure[F]
    else Ref.of(SortedSet.from(interfaces.toList.tupleLeft(0))).map(new SortedPeerInterface(_))
  implicit def interfacesOrdering[F[_]]: Ordering[(Int, PeerBlockchainInterface[F])] = Ordering.by(_._1)
