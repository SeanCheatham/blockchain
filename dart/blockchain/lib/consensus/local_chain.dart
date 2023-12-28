import 'dart:async';

import 'package:blockchain/common/block_height_tree.dart';
import 'package:blockchain/common/event_sourced_state.dart';
import 'package:blockchain/common/resource.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';
import 'package:fixnum/fixnum.dart';

abstract class LocalChain {
  Future<void> adopt(BlockId newHead);
  Future<BlockId> get currentHead;
  BlockId get genesis;
  Stream<BlockId> get adoptions;
  Future<BlockId?> blockIdAtHeight(Int64 height);
}

class LocalChainImpl extends LocalChain {
  final BlockId genesis;
  LocalChainImpl(this.genesis, BlockId initialHead, this._blockHeightTree,
      this._heightOfBlock, this._streamController)
      : this._currentHead = initialHead;
  BlockId _currentHead;

  final EventSourcedState<BlockHeightTreeState, BlockId> _blockHeightTree;

  final Future<Int64> Function(BlockId) _heightOfBlock;

  final StreamController<BlockId> _streamController;

  static Resource<LocalChainImpl> make(
          BlockId genesis,
          BlockId initialHead,
          BlockHeightTree blockHeightTree,
          Future<Int64> Function(BlockId) heightOfBlock) =>
      Resource.streamController(() => StreamController<BlockId>.broadcast())
          .map((controller) => LocalChainImpl(genesis, initialHead,
              blockHeightTree, heightOfBlock, controller));

  @override
  Future<void> adopt(BlockId newHead) async {
    if (_currentHead != newHead) {
      _currentHead = newHead;
      _streamController.add(newHead);
    }
  }

  @override
  Stream<BlockId> get adoptions => _streamController.stream;

  @override
  Future<BlockId> get currentHead => Future.sync(() => _currentHead);

  @override
  Future<BlockId?> blockIdAtHeight(Int64 height) async {
    if (height == Int64.ONE)
      return genesis;
    else if (height > 1) {
      return _blockHeightTree.useStateAt(await currentHead, (s) => s(height));
    } else {
      final headId = await currentHead;
      final headHeight = await _heightOfBlock(headId);
      final depth = height.abs();
      if (headHeight >= depth)
        return _blockHeightTree.useStateAt(
            await currentHead, (s) => s(headHeight - depth));
      else
        return null;
    }
  }
}
