import 'package:giraffe_sdk/sdk.dart';

import 'block_id_tree.dart';
import 'common/clock.dart';
import 'consensus/consensus.dart';
import 'store.dart';

class BlockchainCore {
  final ProtocolSettings protocolSettings;
  final Clock clock;
  final DataStores dataStores;
  final BlockIdTree blockIdTree;
  final Consensus consensus;

  BlockchainCore({
    required this.protocolSettings,
    required this.clock,
    required this.dataStores,
    required this.blockIdTree,
    required this.consensus,
  });

  static Future<BlockchainCore> make(FullBlock genesis) async {
    final protocolSettings =
        ProtocolSettings.defaultSettings.mergeFromMap(genesis.header.settings);
    final clock = ClockImpl(protocolSettings.slotDuration,
        protocolSettings.epochLength, genesis.header.timestamp);
    final dataStores = DataStores.make();
    await dataStores.init(genesis);
    final blockIdTree = BlockIdTreeImpl(
        read: dataStores.blockIdTree.get, write: dataStores.blockIdTree.put);
    final getterSetters = EventIdGetterSetters.make(dataStores.currentEventIds);
    final consensus = await Consensus.make(genesis, clock, dataStores,
        blockIdTree, protocolSettings, getterSetters);
    return BlockchainCore(
        protocolSettings: protocolSettings,
        clock: clock,
        dataStores: dataStores,
        blockIdTree: blockIdTree,
        consensus: consensus);
  }

  Future<void> close() async {
    await consensus.close();
  }
}
