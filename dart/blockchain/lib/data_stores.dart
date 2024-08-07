import 'dart:io';
import 'dart:typed_data';

import 'package:blockchain/codecs.dart';
import 'package:blockchain/common/resource.dart';
import 'package:blockchain/common/store.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';
import 'package:blockchain_sdk/sdk.dart';
import 'package:fixnum/fixnum.dart';
import 'package:logging/logging.dart';
import 'package:ribs_effect/ribs_effect.dart';

class DataStores {
  final Store<BlockId, (Int64, BlockId)> parentChildTree;
  final Store<int, BlockId> currentEventIds;
  final Store<BlockId, BlockHeader> headers;
  final Store<BlockId, BlockBody> bodies;
  final Store<TransactionId, Transaction> transactions;
  final Store<TransactionId, Uint32List> spendableTransactionOutputs;
  final Store<Int64, BlockId> epochBoundaries;
  final Store<void, Int64> delayedActiveStake;
  final Store<void, Int64> delayedInactiveStake;
  final Store<TransactionOutputReference, ActiveStaker> delayedActiveStakers;
  final Store<Int64, BlockId> blockHeightTree;
  final Store<int, List<int>> metadata;

  DataStores({
    required this.parentChildTree,
    required this.currentEventIds,
    required this.headers,
    required this.bodies,
    required this.transactions,
    required this.spendableTransactionOutputs,
    required this.epochBoundaries,
    required this.delayedActiveStake,
    required this.delayedInactiveStake,
    required this.delayedActiveStakers,
    required this.blockHeightTree,
    required this.metadata,
  });

  static final log = Logger("DataStoresInit");

  static String interpolateBlockId(String base, BlockId genesisId) =>
      base.replaceAll("{genesisId}", genesisId.show);

  static Resource<DataStores> make() {
    makeDb<Key, Value>() => InMemoryStore<Key, Value>();
    return Resource.pure(
      DataStores(
        parentChildTree: makeDb(),
        currentEventIds: makeDb(),
        headers: makeDb(),
        bodies: makeDb(),
        transactions: makeDb(),
        spendableTransactionOutputs: makeDb(),
        epochBoundaries: makeDb(),
        delayedActiveStake: makeDb(),
        delayedInactiveStake: makeDb(),
        delayedActiveStakers: makeDb(),
        blockHeightTree: makeDb(),
        metadata: makeDb(),
      ),
    );
  }

  static Resource<DataStores> makePersistent(Directory directory) =>
      HiveStore.makeHive(directory).flatMap((hive) {
        final parentChildTreeR = HiveStore.make<BlockId, (Int64, BlockId)>(
            "parent-child-tree",
            hive,
            PersistenceCodecs.encodeBlockId,
            PersistenceCodecs.encodeHeightBlockId,
            PersistenceCodecs.decodeBlockId,
            PersistenceCodecs.decodeHeightBlockId);
        final currentEventIdsR = HiveStore.make<int, BlockId>(
            "current-event-ids",
            hive,
            (key) => Uint8List.fromList([key]),
            PersistenceCodecs.encodeBlockId,
            (bytes) => bytes[0],
            PersistenceCodecs.decodeBlockId);
        final headersR = HiveStore.make<BlockId, BlockHeader>(
            "block-header",
            hive,
            PersistenceCodecs.encodeBlockId,
            (value) => value.writeToBuffer(),
            PersistenceCodecs.decodeBlockId,
            BlockHeader.fromBuffer);
        final bodiesR = HiveStore.make<BlockId, BlockBody>(
            "block-body",
            hive,
            PersistenceCodecs.encodeBlockId,
            (value) => value.writeToBuffer(),
            PersistenceCodecs.decodeBlockId,
            BlockBody.fromBuffer);
        final transactionsR = HiveStore.make<TransactionId, Transaction>(
            "transactions",
            hive,
            PersistenceCodecs.encodeTransactionId,
            (value) => value.writeToBuffer(),
            PersistenceCodecs.decodeTransactionId,
            Transaction.fromBuffer);
        final spendableTransactionoutputsR =
            HiveStore.make<TransactionId, Uint32List>(
          "spendable-transaction-outputs",
          hive,
          PersistenceCodecs.encodeTransactionId,
          (value) => value.buffer.asUint8List(),
          PersistenceCodecs.decodeTransactionId,
          (bytes) => bytes.buffer.asUint32List(),
        );
        final epochBoundariesR = HiveStore.make<Int64, BlockId>(
            "epoch-boundaries",
            hive,
            (key) => Uint8List.fromList(key.toBytesBigEndian()),
            PersistenceCodecs.encodeBlockId,
            Int64.fromBytesBigEndian,
            PersistenceCodecs.decodeBlockId);
        final delayedActiveStakeR = HiveStore.make<void, Int64>(
            "delayed-active-stake",
            hive,
            (_) => Uint8List(1),
            (value) => Uint8List.fromList(value.toBytesBigEndian()),
            (_) {},
            Int64.fromBytesBigEndian);
        final delayedInactiveStakeR = HiveStore.make<void, Int64>(
            "delayed-inactive-stake",
            hive,
            (_) => Uint8List(1),
            (value) => Uint8List.fromList(value.toBytesBigEndian()),
            (_) {},
            Int64.fromBytesBigEndian);
        final delayedActiveStakersR =
            HiveStore.make<TransactionOutputReference, ActiveStaker>(
                "delayed-active-stakers",
                hive,
                (key) => key.writeToBuffer(),
                (value) => value.writeToBuffer(),
                TransactionOutputReference.fromBuffer,
                ActiveStaker.fromBuffer);
        final blockHeightTreeR = HiveStore.make<Int64, BlockId>(
            "block-height-tree",
            hive,
            (key) => Uint8List.fromList(key.toBytesBigEndian()),
            PersistenceCodecs.encodeBlockId,
            Int64.fromBytesBigEndian,
            PersistenceCodecs.decodeBlockId);
        final metadataR = HiveStore.make<int, List<int>>(
            "delayed-metadata",
            hive,
            (key) => Uint8List.fromList([key]),
            Uint8List.fromList,
            (bytes) => bytes[0],
            (bytes) => bytes);
        return (
          parentChildTreeR,
          currentEventIdsR,
          headersR,
          bodiesR,
          transactionsR,
          spendableTransactionoutputsR,
          epochBoundariesR,
          delayedActiveStakeR,
          delayedInactiveStakeR,
          delayedActiveStakersR,
          blockHeightTreeR,
          metadataR
        ).mapN((parentChildTree,
                currentEventIds,
                headers,
                bodies,
                transactions,
                spendableTransactionOutputs,
                epochBoundaries,
                delayedActiveStake,
                delayedInactiveStake,
                delayedActiveStakers,
                blockHeightTree,
                metadata) =>
            DataStores(
              parentChildTree: parentChildTree.cached(maximumSize: 512),
              currentEventIds: currentEventIds.cached(maximumSize: 32),
              headers: headers.cached(maximumSize: 512),
              bodies: bodies.cached(maximumSize: 512),
              transactions: transactions.cached(maximumSize: 512),
              spendableTransactionOutputs:
                  spendableTransactionOutputs.cached(maximumSize: 512),
              epochBoundaries: epochBoundaries.cached(maximumSize: 16),
              delayedActiveStake: delayedActiveStake.cached(maximumSize: 1),
              delayedInactiveStake: delayedInactiveStake.cached(maximumSize: 1),
              delayedActiveStakers:
                  delayedActiveStakers.cached(maximumSize: 512),
              blockHeightTree: blockHeightTree.cached(maximumSize: 512),
              metadata: metadata,
            ));
      });

  Future<bool> isInitialized(BlockId genesisId) async {
    final storeGenesisId = await blockHeightTree.get(Int64.ONE);
    if (storeGenesisId == null) {
      log.info("Data Stores not initialized");
      return false;
    }
    if (storeGenesisId != genesisId)
      throw ArgumentError("Data store belongs to different chain");
    log.info("Data Stores already initialized to genesis id=${genesisId.show}");
    return true;
  }

  Future<void> init(FullBlock genesisBlock) async {
    log.info(
        "Initializing data stores to genesis id=${genesisBlock.header.id.show}");
    final genesisBlockId = await genesisBlock.header.id;

    await currentEventIds.put(
        CurreventEventIdGetterSetterIndices.CanonicalHead, genesisBlockId);

    await currentEventIds.put(
        CurreventEventIdGetterSetterIndices.BlockHeightTree, genesisBlockId);
    for (final key in [
      CurreventEventIdGetterSetterIndices.ConsensusData,
      CurreventEventIdGetterSetterIndices.EpochBoundaries,
      CurreventEventIdGetterSetterIndices.SpendableTransactionOutputs,
      CurreventEventIdGetterSetterIndices.Mempool,
    ]) {
      await currentEventIds.put(key, genesisBlock.header.parentHeaderId);
    }

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
    await blockHeightTree.put(Int64.ONE, genesisBlock.header.id);
    if (!await delayedActiveStake.contains("")) {
      await delayedActiveStake.put("", Int64.ZERO);
    }
    if (!await delayedInactiveStake.contains("")) {
      await delayedInactiveStake.put("", Int64.ZERO);
    }
    await parentChildTree.put(genesisBlock.header.id,
        (genesisBlock.header.height, genesisBlock.header.parentHeaderId));
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
  static const SpendableTransactionOutputs = 4;
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

  GetterSetter get transactionOutputs => GetterSetter.forByte(
      store, CurreventEventIdGetterSetterIndices.SpendableTransactionOutputs);

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

class MetadataIndices {
  static const p2pSk = 1;
}
