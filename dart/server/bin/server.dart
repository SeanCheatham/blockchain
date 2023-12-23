import 'dart:io';

import 'package:blockchain/blockchain.dart';
import 'package:blockchain/config.dart';
import 'package:blockchain/isolate_pool.dart';
import 'package:blockchain/crypto/ed25519.dart' as ed25519;
import 'package:blockchain/crypto/ed25519vrf.dart' as ed25519VRF;
import 'package:blockchain/crypto/kes.dart' as kes;
import 'package:logging/logging.dart';

final BlockchainConfig config = BlockchainConfig();
Future<void> main() async {
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    print(
        '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
  });

  final resource = IsolatePool.make(Platform.numberOfProcessors)
      .map((p) => p.isolate)
      .tap((isolate) {
    ed25519.ed25519 = ed25519.Ed25519Isolated(isolate);
    ed25519VRF.ed25519Vrf = ed25519VRF.Ed25519VRFIsolated(isolate);
    kes.kesProduct = kes.KesProudctIsolated(isolate);
  }).flatMap((isolate) => Blockchain.init(config, isolate)
          .flatTap((blockchain) => blockchain.run()));
  final (_, finalizer) = await resource.allocated();

  await ProcessSignal.sigint.watch().asyncMap((_) => finalizer()).drain();
}
