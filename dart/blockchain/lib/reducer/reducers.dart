import 'dart:io';

import 'package:blockchain/blockchain_view.dart';
import 'package:blockchain/common/resource.dart';
import 'package:blockchain/reducer/reducer_instance.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';
import 'package:ribs_core/ribs_core.dart';

class Reducers {
  final Directory baseDir;
  final Ref<ReducersState> stateRef;
  final BlockchainView view;
  final Function(String id, ReducerState newState) onReducerUpdated;

  Reducers(
      {required this.baseDir,
      required this.stateRef,
      required this.view,
      required this.onReducerUpdated});

  IO<Unit> addReducer(ReducerInstance instance) =>
      ResourceUtils.backgroundStream(instance
              .follow(view)
              .map((s) => onReducerUpdated(instance.id, s)))
          .useForever()
          .start()
          .flatMap((fiber) => stateRef.update((current) => current.withInstance(
              _ReducerInstanceWithCleanup(
                  instance: instance, cleanup: fiber.cancel()))))
          .voided();

  IO<Option<ReducerInstance>> getReducer(String id) =>
      stateRef.value().map((s) => s.instances.get(id).map((i) => i.instance));

  IO<ReducerInstance> getOrLoadReducer(String id) =>
      getReducer(id).flatMap((reducerOpt) => reducerOpt.fold(
          () => ReducerInstance.load(baseDir, id).flatTap(addReducer),
          IO.pure));

  IO<IList<ReducerInstance>> get reducers =>
      stateRef.value().map((v) => v.instances.values.map((v) => v.instance));
}

class ReducersState {
  final IMap<String, _ReducerInstanceWithCleanup> instances;

  ReducersState({required this.instances});

  ReducersState withInstance(_ReducerInstanceWithCleanup instanceWithCleanup) =>
      ReducersState(
          instances: instances.updated(
              instanceWithCleanup.instance.id, instanceWithCleanup));

  (ReducersState state, IO<Unit> stateCleanup) evict(String id) {
    final instanceOpt = instances.get(id);
    final newState = instanceOpt.isDefined
        ? ReducersState(instances: instances.removed(id))
        : this;
    final cleanup = instanceOpt.fold(() => IO.unit, (v) => v.cleanup);
    return (newState, cleanup);
  }
}

class _ReducerInstanceWithCleanup {
  final ReducerInstance instance;
  final IO<Unit> cleanup;

  _ReducerInstanceWithCleanup({required this.instance, required this.cleanup});
}
