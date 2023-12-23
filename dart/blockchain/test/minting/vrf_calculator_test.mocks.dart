// Mocks generated by Mockito 5.4.4 from annotations
// in blockchain/test/minting/vrf_calculator_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:blockchain/common/clock.dart' as _i4;
import 'package:blockchain/consensus/leader_election_validation.dart' as _i6;
import 'package:fixnum/fixnum.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rational/rational.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDuration_0 extends _i1.SmartFake implements Duration {
  _FakeDuration_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInt64_1 extends _i1.SmartFake implements _i2.Int64 {
  _FakeInt64_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRational_2 extends _i1.SmartFake implements _i3.Rational {
  _FakeRational_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ClockAlgebra].
///
/// See the documentation for Mockito's code generation for more information.
class MockClockAlgebra extends _i1.Mock implements _i4.ClockAlgebra {
  @override
  Duration get slotLength => (super.noSuchMethod(
        Invocation.getter(#slotLength),
        returnValue: _FakeDuration_0(
          this,
          Invocation.getter(#slotLength),
        ),
        returnValueForMissingStub: _FakeDuration_0(
          this,
          Invocation.getter(#slotLength),
        ),
      ) as Duration);

  @override
  _i2.Int64 get slotsPerEpoch => (super.noSuchMethod(
        Invocation.getter(#slotsPerEpoch),
        returnValue: _FakeInt64_1(
          this,
          Invocation.getter(#slotsPerEpoch),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.getter(#slotsPerEpoch),
        ),
      ) as _i2.Int64);

  @override
  _i2.Int64 get globalSlot => (super.noSuchMethod(
        Invocation.getter(#globalSlot),
        returnValue: _FakeInt64_1(
          this,
          Invocation.getter(#globalSlot),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.getter(#globalSlot),
        ),
      ) as _i2.Int64);

  @override
  _i2.Int64 get localTimestamp => (super.noSuchMethod(
        Invocation.getter(#localTimestamp),
        returnValue: _FakeInt64_1(
          this,
          Invocation.getter(#localTimestamp),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.getter(#localTimestamp),
        ),
      ) as _i2.Int64);

  @override
  _i2.Int64 get forwardBiasedSlotWindow => (super.noSuchMethod(
        Invocation.getter(#forwardBiasedSlotWindow),
        returnValue: _FakeInt64_1(
          this,
          Invocation.getter(#forwardBiasedSlotWindow),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.getter(#forwardBiasedSlotWindow),
        ),
      ) as _i2.Int64);

  @override
  _i2.Int64 get globalEpoch => (super.noSuchMethod(
        Invocation.getter(#globalEpoch),
        returnValue: _FakeInt64_1(
          this,
          Invocation.getter(#globalEpoch),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.getter(#globalEpoch),
        ),
      ) as _i2.Int64);

  @override
  _i5.Stream<_i2.Int64> get slots => (super.noSuchMethod(
        Invocation.getter(#slots),
        returnValue: _i5.Stream<_i2.Int64>.empty(),
        returnValueForMissingStub: _i5.Stream<_i2.Int64>.empty(),
      ) as _i5.Stream<_i2.Int64>);

  @override
  _i2.Int64 timestampToSlot(_i2.Int64? timestamp) => (super.noSuchMethod(
        Invocation.method(
          #timestampToSlot,
          [timestamp],
        ),
        returnValue: _FakeInt64_1(
          this,
          Invocation.method(
            #timestampToSlot,
            [timestamp],
          ),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.method(
            #timestampToSlot,
            [timestamp],
          ),
        ),
      ) as _i2.Int64);

  @override
  (_i2.Int64, _i2.Int64) slotToTimestamps(_i2.Int64? slot) =>
      (super.noSuchMethod(
        Invocation.method(
          #slotToTimestamps,
          [slot],
        ),
        returnValue: (
          _FakeInt64_1(
            this,
            Invocation.method(
              #slotToTimestamps,
              [slot],
            ),
          ),
          _FakeInt64_1(
            this,
            Invocation.method(
              #slotToTimestamps,
              [slot],
            ),
          )
        ),
        returnValueForMissingStub: (
          _FakeInt64_1(
            this,
            Invocation.method(
              #slotToTimestamps,
              [slot],
            ),
          ),
          _FakeInt64_1(
            this,
            Invocation.method(
              #slotToTimestamps,
              [slot],
            ),
          )
        ),
      ) as (_i2.Int64, _i2.Int64));

  @override
  _i5.Future<void> delayedUntilSlot(_i2.Int64? slot) => (super.noSuchMethod(
        Invocation.method(
          #delayedUntilSlot,
          [slot],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> delayedUntilTimestamp(_i2.Int64? timestamp) =>
      (super.noSuchMethod(
        Invocation.method(
          #delayedUntilTimestamp,
          [timestamp],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i2.Int64 epochOfSlot(_i2.Int64? slot) => (super.noSuchMethod(
        Invocation.method(
          #epochOfSlot,
          [slot],
        ),
        returnValue: _FakeInt64_1(
          this,
          Invocation.method(
            #epochOfSlot,
            [slot],
          ),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.method(
            #epochOfSlot,
            [slot],
          ),
        ),
      ) as _i2.Int64);

  @override
  (_i2.Int64, _i2.Int64) epochRange(_i2.Int64? epoch) => (super.noSuchMethod(
        Invocation.method(
          #epochRange,
          [epoch],
        ),
        returnValue: (
          _FakeInt64_1(
            this,
            Invocation.method(
              #epochRange,
              [epoch],
            ),
          ),
          _FakeInt64_1(
            this,
            Invocation.method(
              #epochRange,
              [epoch],
            ),
          )
        ),
        returnValueForMissingStub: (
          _FakeInt64_1(
            this,
            Invocation.method(
              #epochRange,
              [epoch],
            ),
          ),
          _FakeInt64_1(
            this,
            Invocation.method(
              #epochRange,
              [epoch],
            ),
          )
        ),
      ) as (_i2.Int64, _i2.Int64));
}

/// A class which mocks [LeaderElectionValidationAlgebra].
///
/// See the documentation for Mockito's code generation for more information.
class MockLeaderElectionValidationAlgebra extends _i1.Mock
    implements _i6.LeaderElectionValidationAlgebra {
  @override
  _i5.Future<_i3.Rational> getThreshold(
    _i3.Rational? relativeStake,
    _i2.Int64? slotDiff,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getThreshold,
          [
            relativeStake,
            slotDiff,
          ],
        ),
        returnValue: _i5.Future<_i3.Rational>.value(_FakeRational_2(
          this,
          Invocation.method(
            #getThreshold,
            [
              relativeStake,
              slotDiff,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Rational>.value(_FakeRational_2(
          this,
          Invocation.method(
            #getThreshold,
            [
              relativeStake,
              slotDiff,
            ],
          ),
        )),
      ) as _i5.Future<_i3.Rational>);

  @override
  _i5.Future<bool> isEligible(
    _i3.Rational? threshold,
    List<int>? rho,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #isSlotLeaderForThreshold,
          [
            threshold,
            rho,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
