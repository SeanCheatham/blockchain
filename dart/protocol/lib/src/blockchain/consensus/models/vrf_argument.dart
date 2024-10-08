import '../../common/models/common.dart';
import 'package:giraffe_sdk/sdk.dart';

class VrfArgument {
  final Eta eta;
  final Slot slot;

  VrfArgument(this.eta, this.slot);

  List<int> get signableBytes => [...eta, ...slot.immutableBytes];

  @override
  int get hashCode => Object.hash(eta, slot);

  @override
  bool operator ==(Object other) {
    if (other is VrfArgument) {
      eta.sameElements(other.eta) && slot == other.slot;
    }
    return false;
  }
}
