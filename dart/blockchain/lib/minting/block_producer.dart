import 'dart:async';
import 'dart:math';

import 'package:blockchain/codecs.dart';
import 'package:blockchain/common/clock.dart';
import 'package:blockchain/common/models/unsigned.dart';
import 'package:async/async.dart';
import 'package:blockchain/minting/block_packer.dart';
import 'package:blockchain/minting/models/vrf_hit.dart';
import 'package:blockchain/minting/staking.dart';
import 'package:fixnum/fixnum.dart';
import 'package:logging/logging.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';

abstract class BlockProducerAlgebra {
  Stream<FullBlock> get blocks;
}

class BlockProducer extends BlockProducerAlgebra {
  final Stream<SlotData> parentHeaders;
  final StakingAlgebra staker;
  final ClockAlgebra clock;
  final BlockPackerAlgebra blockPacker;

  BlockProducer(this.parentHeaders, this.staker, this.clock, this.blockPacker);

  final log = Logger("BlockProducer");

  @override
  Stream<FullBlock> get blocks {
    final transformer =
        StreamTransformer((Stream<SlotData> stream, cancelOnError) {
      CancelableOperation<FullBlock?>? currentOperation = null;
      final controller = StreamController<FullBlock>(sync: true);
      controller.onListen = () {
        final subscription = stream.listen((data) {
          currentOperation?.cancel();
          final nextOp = _makeChild(data);
          currentOperation = nextOp;
          unawaited(nextOp.valueOrCancellation(null).then((blockOpt) {
            if (blockOpt != null) controller.add(blockOpt);
          }));
        },
            onError: controller.addError,
            onDone: controller.close,
            cancelOnError: cancelOnError);
        controller
          ..onPause = subscription.pause
          ..onResume = subscription.resume
          ..onCancel = () async {
            await currentOperation?.cancel();
            await subscription.cancel;
          };
      };
      return controller.stream.listen(null);
    });
    return parentHeaders.transform(transformer);
  }

  CancelableOperation<FullBlock?> _makeChild(SlotData parentSlotData) {
    late final CancelableOperation<FullBlock?> completer;

    Future<FullBlock?> go() async {
      final nextHit = await _nextEligibility(parentSlotData.slotId);
      if (nextHit != null) {
        log.info("Packing block for slot=${nextHit.slot}");
        final bodyOpt = await _prepareBlockBody(
          parentSlotData,
          nextHit.slot,
          () => completer.isCanceled,
        );
        if (bodyOpt != null) {
          log.info("Constructing block for slot=${nextHit.slot}");
          final now = DateTime.now().millisecondsSinceEpoch;
          final (slotStart, slotEnd) = clock.slotToTimestamps(nextHit.slot);
          final timestamp =
              Int64(min(slotEnd.toInt(), max(now, slotStart.toInt())));
          final maybeHeader = await staker.certifyBlock(
              parentSlotData.slotId,
              nextHit.slot,
              _prepareUnsignedBlock(
                parentSlotData,
                bodyOpt,
                timestamp,
                nextHit,
              ));
          if (maybeHeader != null) {
            final headerId = await maybeHeader.id;
            final transactionIds = bodyOpt.transactions.map((tx) => tx.id);
            log.info(
                "Produced block id=${headerId.show} height=${maybeHeader.height} slot=${maybeHeader.slot} parentId=${maybeHeader.parentHeaderId.show} transactionIds=[${transactionIds.map((i) => i.show).join(",")}]");
            return FullBlock()
              ..header = maybeHeader
              ..fullBody = bodyOpt;
          } else {
            log.warning("Failed to produce block at next slot=${nextHit.slot}");
          }
        }
      }
      return null;
    }

    completer = CancelableOperation.fromFuture(go());
    return completer;
  }

  Future<VrfHit?> _nextEligibility(SlotId parentSlotId) async {
    Int64 test = parentSlotId.slot + 1;
    final exitSlot =
        clock.epochRange(clock.epochOfSlot(parentSlotId.slot) + 1).$2;
    VrfHit? maybeHit;
    while (maybeHit == null && test < exitSlot) {
      maybeHit = await staker.elect(parentSlotId, test);
      test = test + 1;
    }
    return maybeHit;
  }

  Future<FullBlockBody?> _prepareBlockBody(SlotData parentSlotData,
      Int64 targetSlot, bool Function() isCanceled) async {
    FullBlockBody body = FullBlockBody();
    bool c = isCanceled();
    final iterative = await blockPacker.improvePackedBlock(
        parentSlotData.slotId.blockId, parentSlotData.height + 1, targetSlot);
    while (!c && clock.globalSlot <= targetSlot) {
      final newIteration = await iterative(body);
      if (newIteration != null)
        body = newIteration;
      else
        await Future.delayed(Duration(milliseconds: 50));
      c = isCanceled();
    }
    if (c) return null;
    return body;
  }

  UnsignedBlockHeader Function(PartialOperationalCertificate)
      _prepareUnsignedBlock(SlotData parentSlotData, FullBlockBody fullBody,
              Int64 timestamp, VrfHit nextHit) =>
          (PartialOperationalCertificate partialOperationalCertificate) =>
              UnsignedBlockHeader(
                parentSlotData.slotId.blockId,
                parentSlotData.slotId.slot,
                [], // TODO
                [], // TODO
                timestamp,
                parentSlotData.height + 1,
                nextHit.slot,
                nextHit.cert,
                partialOperationalCertificate,
                [],
                staker.address,
              );
}
