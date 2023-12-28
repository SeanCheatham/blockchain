import 'package:blockchain/codecs.dart';
import 'package:blockchain/common/resource.dart';
import 'package:blockchain/common/store.dart';
import 'package:blockchain/consensus/utils.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';
import 'package:fixnum/fixnum.dart';

class DataStores {
  final Store<BlockId, (Int64, BlockId)> parentChildTree;
  final Store<int, BlockId> currentEventIds;
  final Store<BlockId, SlotData> slotData;
  final Store<BlockId, BlockHeader> headers;
  final Store<BlockId, BlockBody> bodies;
  final Store<TransactionId, Transaction> transactions;
  final Store<TransactionId, List<int>> spendableBoxIds;
  final Store<Int64, BlockId> epochBoundaries;
  final Store<void, Int64> activeStake;
  final Store<void, Int64> inactiveStake;
  final Store<StakingAddress, ActiveStaker> activeStakers;
  final Store<Int64, BlockId> blockHeightTree;
  final Store<int, List<int>> metadata;

  DataStores({
    required this.parentChildTree,
    required this.currentEventIds,
    required this.slotData,
    required this.headers,
    required this.bodies,
    required this.transactions,
    required this.spendableBoxIds,
    required this.epochBoundaries,
    required this.activeStake,
    required this.inactiveStake,
    required this.activeStakers,
    required this.blockHeightTree,
    required this.metadata,
  });

  static Resource<DataStores> make() {
    makeDb<Key, Value>() => InMemoryStore<Key, Value>();
    return Resource.make(
        () async => DataStores(
              parentChildTree: makeDb(),
              currentEventIds: makeDb(),
              slotData: makeDb(),
              headers: makeDb(),
              bodies: makeDb(),
              transactions: makeDb(),
              spendableBoxIds: makeDb(),
              epochBoundaries: makeDb(),
              activeStake: makeDb(),
              inactiveStake: makeDb(),
              activeStakers: makeDb(),
              blockHeightTree: makeDb(),
              metadata: makeDb(),
            ),
        (_) async {});
  }

  Future<bool> isInitialized(BlockId genesisId) async {
    final storeGenesisId = await blockHeightTree.get(Int64.ZERO);
    if (storeGenesisId == null) return false;
    if (storeGenesisId != genesisId)
      throw ArgumentError("Data store belongs to different chain");
    return true;
  }

  Future<void> init(FullBlock genesisBlock) async {
    final genesisBlockId = await genesisBlock.header.id;

    await currentEventIds.put(
        CurreventEventIdGetterSetterIndices.CanonicalHead, genesisBlockId);
    for (final key in [
      CurreventEventIdGetterSetterIndices.ConsensusData,
      CurreventEventIdGetterSetterIndices.EpochBoundaries,
      CurreventEventIdGetterSetterIndices.BlockHeightTree,
      CurreventEventIdGetterSetterIndices.BoxState,
      CurreventEventIdGetterSetterIndices.Mempool,
    ]) {
      await currentEventIds.put(key, genesisBlock.header.parentHeaderId);
    }

    await slotData.put(genesisBlockId, await genesisBlock.header.slotData);
    await headers.put(genesisBlockId, genesisBlock.header);
    await bodies.put(
        genesisBlockId,
        BlockBody()
          ..transactionIds.addAll(
            [
              for (final transaction in genesisBlock.fullBody.transactions)
                await transaction.id
            ],
          ));
    for (final transaction in genesisBlock.fullBody.transactions) {
      await transactions.put(await transaction.id, transaction);
    }
    await blockHeightTree.put(Int64(0), genesisBlock.header.parentHeaderId);
    if (!await activeStake.contains("")) {
      await activeStake.put("", Int64.ZERO);
    }
    if (!await inactiveStake.contains("")) {
      await inactiveStake.put("", Int64.ZERO);
    }
  }

  Future<Block?> getBlock(BlockId id) async {
    final header = await headers.get(id);
    if (header == null) return null;
    final body = await bodies.get(id);
    if (body == null) return null;
    return Block(header: header, body: body);
  }

  Future<FullBlock?> getFullBlock(BlockId id) async {
    final header = await headers.get(id);
    if (header == null) return null;
    final body = await bodies.get(id);
    if (body == null) return null;
    final transactionsResult = <Transaction>[];
    for (final transactionId in body.transactionIds) {
      final transaction = await transactions.get(transactionId);
      if (transaction == null) return null;
      transactionsResult.add(transaction);
    }
    final fullBody = FullBlockBody(transactions: transactionsResult);
    return FullBlock(header: header, fullBody: fullBody);
  }
}

class CurreventEventIdGetterSetterIndices {
  static const CanonicalHead = 0;
  static const ConsensusData = 1;
  static const EpochBoundaries = 2;
  static const BlockHeightTree = 3;
  static const BoxState = 4;
  static const Mempool = 5;
}

class CurrentEventIdGetterSetters {
  final Store<int, BlockId> store;

  CurrentEventIdGetterSetters(this.store);

  GetterSetter get canonicalHead => GetterSetter.forByte(
      store, CurreventEventIdGetterSetterIndices.CanonicalHead);

  GetterSetter get consensusData => GetterSetter.forByte(
      store, CurreventEventIdGetterSetterIndices.ConsensusData);

  GetterSetter get epochBoundaries => GetterSetter.forByte(
      store, CurreventEventIdGetterSetterIndices.EpochBoundaries);

  GetterSetter get blockHeightTree => GetterSetter.forByte(
      store, CurreventEventIdGetterSetterIndices.BlockHeightTree);

  GetterSetter get boxState =>
      GetterSetter.forByte(store, CurreventEventIdGetterSetterIndices.BoxState);

  GetterSetter get mempool =>
      GetterSetter.forByte(store, CurreventEventIdGetterSetterIndices.Mempool);
}

class GetterSetter {
  final Future<BlockId> Function() get;
  final Future<void> Function(BlockId) set;

  GetterSetter(this.get, this.set);

  factory GetterSetter.forByte(Store<int, BlockId> store, int byte) =>
      GetterSetter(
          () => store.getOrRaise(byte), (value) => store.put(byte, value));
}
