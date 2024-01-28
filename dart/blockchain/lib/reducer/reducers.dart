import 'package:blockchain/reducer/reducer_instance.dart';
import 'package:blockchain_protobuf/models/core.pb.dart';
import 'package:ribs_core/ribs_core.dart';

class Reducers {
  final Ref<ReducersState> stateRef;

  Reducers({required this.stateRef});

  IO<Unit> applyBlock(FullBlock block) => stateRef
      .access()
      .map((_) => _.$1)
      .flatMap((state) => state.instances.values
          .parTraverseIO((instance) => instance.applyBlock(block)))
      .voided();

  IO<Unit> unapplyBlock(FullBlock block) => stateRef
      .access()
      .map((_) => _.$1)
      .flatMap((state) => state.instances.values
          .parTraverseIO((instance) => instance.unapplyBlock(block)))
      .voided();
}

class ReducersState {
  final BlockId blockId;
  final IMap<String, ReducerInstance> instances;

  ReducersState({required this.blockId, required this.instances});
}
