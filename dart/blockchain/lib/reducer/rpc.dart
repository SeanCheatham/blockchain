import 'dart:io';

import 'package:blockchain/reducer/reducer_instance.dart';
import 'package:blockchain/reducer/reducers.dart';
import 'package:blockchain_protobuf/services/reducer.pbgrpc.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:grpc/src/server/call.dart';
import 'package:ribs_core/ribs_core.dart';

class ReducerServiceImpl extends ReducerServiceBase {
  final Directory baseDir;
  final Reducers reducers;

  ReducerServiceImpl({required this.baseDir, required this.reducers});

  @override
  Future<CreateReducerRes> createReducer(
      ServiceCall call, CreateReducerReq request) async {
    assert(request.language == "dart");
    return await ReducerInstance.init(request.code, request.input, baseDir)
        .flatTap((instance) => reducers.addReducer(instance))
        .map((instance) => CreateReducerRes(id: Base58Decode(instance.id)))
        .unsafeRunFuture();
  }

  @override
  Future<ReducerStateRes> currentReducerState(
      ServiceCall call, ReducerStateReq request) async {
    final id = Base58Encode(request.id);
    return await reducers
        .getReducer(id)
        .flatMap<ReducerInstance>((rOpt) => rOpt.fold(
            () => IO.raiseError(RuntimeException("Unknown Reducer ID")),
            IO.pure))
        .flatMap((i) => i.stateRef.value().map((r) => ReducerStateRes(
            id: request.id, blockId: r.blockId, output: r.state)))
        .unsafeRunFuture();
  }

  @override
  Stream<ReducerStateRes> streamedReducerState(
      ServiceCall call, ReducerStateReq request) {
    // TODO: implement streamedReducerState
    throw UnimplementedError();
  }
}
