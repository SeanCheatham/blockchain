import 'package:fixnum/fixnum.dart';
import 'package:rational/rational.dart';

class ProtocolSettings {
  final Rational fEffective;
  final int vrfLddCutoff;
  final int vrfPrecision;
  final Rational vrfBaselineDifficulty;
  final Rational vrfAmplitude;
  final int vrfSlotGap;
  final int chainSelectionKLookback;
  final Duration slotDuration;

  ProtocolSettings({
    required this.fEffective,
    required this.vrfLddCutoff,
    required this.vrfPrecision,
    required this.vrfBaselineDifficulty,
    required this.vrfAmplitude,
    required this.vrfSlotGap,
    required this.chainSelectionKLookback,
    required this.slotDuration,
  });

  factory ProtocolSettings.fromMap(Map<String, String> map) => ProtocolSettings(
        fEffective: _parseRational(map["f-effective"]!),
        vrfLddCutoff: int.parse(map["vrf-ldd-cutoff"]!),
        vrfPrecision: int.parse(map["vrf-precision"]!),
        vrfBaselineDifficulty: _parseRational(map["vrf-baseline-difficulty"]!),
        vrfAmplitude: _parseRational(map["vrf-amplitude"]!),
        vrfSlotGap: int.parse(map["vrf-slot-gap"]!),
        chainSelectionKLookback: int.parse(map["chain-selection-k-lookback"]!),
        slotDuration:
            Duration(milliseconds: int.parse(map["slot-duration-ms"]!)),
      );

  ProtocolSettings mergeFromMap(Map<String, String> map) => ProtocolSettings(
        fEffective: map.containsKey("f-effective")
            ? _parseRational(map["f-effective"]!)
            : fEffective,
        vrfLddCutoff: map.containsKey("vrf-ldd-cutoff")
            ? int.parse(map["vrf-ldd-cutoff"]!)
            : vrfLddCutoff,
        vrfPrecision: map.containsKey("vrf-precision")
            ? int.parse(map["vrf-precision"]!)
            : vrfPrecision,
        vrfBaselineDifficulty: map.containsKey("vrf-baseline-difficulty")
            ? _parseRational(map["vrf-baseline-difficulty"]!)
            : vrfBaselineDifficulty,
        vrfAmplitude: map.containsKey("vrf-amplitude")
            ? _parseRational(map["vrf-amplitude"]!)
            : vrfAmplitude,
        vrfSlotGap: map.containsKey("vrf-slot-gap")
            ? int.parse(map["vrf-slot-gap"]!)
            : vrfSlotGap,
        chainSelectionKLookback: map.containsKey("chain-selection-k-lookback")
            ? int.parse(map["chain-selection-k-lookback"]!)
            : chainSelectionKLookback,
        slotDuration: map.containsKey("slot-duration-ms")
            ? Duration(milliseconds: int.parse(map["slot-duration-ms"]!))
            : slotDuration,
      );

  static const defaultAsMap = {
    "f-effective": "3/25",
    "vrf-ldd-cutoff": "18",
    "vrf-precision": "40",
    "vrf-baseline-difficulty": "1/20",
    "vrf-amplitude": "1/2",
    "vrf-slot-gap": "1",
    "chain-selection-k-lookback": "576",
    "slot-duration-ms": "3000",
  };

  @override
  String toString() =>
      "ProtocolSettings(fEffective=$fEffective, vrfLddCutoff=$vrfLddCutoff, vrfPrecision=$vrfPrecision, vrfBaselineDifficulty=$vrfBaselineDifficulty, vrfAmplitude=$vrfAmplitude, vrfSlotGap=$vrfSlotGap, kLookback=$chainSelectionKLookback slotDuration=${slotDuration.inMilliseconds}ms, epochLength=$epochLength)";

  static final ProtocolSettings defaultSettings =
      ProtocolSettings.fromMap(defaultAsMap);

  int get chainSelectionSWindow =>
      (Rational(BigInt.from(chainSelectionKLookback), BigInt.from(4)) *
              fEffective.inverse)
          .round()
          .toInt();

  Int64 get epochLength =>
      Int64((Rational(BigInt.from(chainSelectionKLookback)) *
              fEffective.inverse *
              Rational(BigInt.from(3)))
          .round()
          .toInt());
}

_parseRational(String value) {
  final split = value.split("/");
  if (split.length == 1)
    return Rational(BigInt.parse(split[0]));
  else
    return Rational(BigInt.parse(split[0]), BigInt.parse(split[1]));
}
