// Mocks generated by Mockito 5.4.4 from annotations
// in blockchain/test/minting/vrf_calculator_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:blockchain/common/clock.dart' as _i5;
import 'package:blockchain/consensus/leader_election_validation.dart' as _i8;
import 'package:fixnum/fixnum.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;
import 'package:rational/rational.dart' as _i4;
import 'package:ribs_effect/ribs_effect.dart' as _i6;

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

class _FakeTimer_2 extends _i1.SmartFake implements _i3.Timer {
  _FakeTimer_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRational_3 extends _i1.SmartFake implements _i4.Rational {
  _FakeRational_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Clock].
///
/// See the documentation for Mockito's code generation for more information.
class MockClock extends _i1.Mock implements _i5.Clock {
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
  _i2.Int64 get slotsPerOperationalPeriod => (super.noSuchMethod(
        Invocation.getter(#slotsPerOperationalPeriod),
        returnValue: _FakeInt64_1(
          this,
          Invocation.getter(#slotsPerOperationalPeriod),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.getter(#slotsPerOperationalPeriod),
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
  _i2.Int64 get globalOperationalPeriod => (super.noSuchMethod(
        Invocation.getter(#globalOperationalPeriod),
        returnValue: _FakeInt64_1(
          this,
          Invocation.getter(#globalOperationalPeriod),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.getter(#globalOperationalPeriod),
        ),
      ) as _i2.Int64);

  @override
  _i3.Stream<_i2.Int64> get slots => (super.noSuchMethod(
        Invocation.getter(#slots),
        returnValue: _i3.Stream<_i2.Int64>.empty(),
        returnValueForMissingStub: _i3.Stream<_i2.Int64>.empty(),
      ) as _i3.Stream<_i2.Int64>);

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
  _i6.IO<void> delayedUntilTimestamp(_i2.Int64? timestamp) =>
      (super.noSuchMethod(
        Invocation.method(
          #delayedUntilTimestamp,
          [timestamp],
        ),
        returnValue: _i7.dummyValue<_i6.IO<void>>(
          this,
          Invocation.method(
            #delayedUntilTimestamp,
            [timestamp],
          ),
        ),
        returnValueForMissingStub: _i7.dummyValue<_i6.IO<void>>(
          this,
          Invocation.method(
            #delayedUntilTimestamp,
            [timestamp],
          ),
        ),
      ) as _i6.IO<void>);

  @override
  _i6.IO<void> delayedUntilSlot(_i2.Int64? slot) => (super.noSuchMethod(
        Invocation.method(
          #delayedUntilSlot,
          [slot],
        ),
        returnValue: _i7.dummyValue<_i6.IO<void>>(
          this,
          Invocation.method(
            #delayedUntilSlot,
            [slot],
          ),
        ),
        returnValueForMissingStub: _i7.dummyValue<_i6.IO<void>>(
          this,
          Invocation.method(
            #delayedUntilSlot,
            [slot],
          ),
        ),
      ) as _i6.IO<void>);

  @override
  _i3.Timer timerUntilTimestamp(
    _i2.Int64? timestamp,
    void Function()? onComplete,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #timerUntilTimestamp,
          [
            timestamp,
            onComplete,
          ],
        ),
        returnValue: _FakeTimer_2(
          this,
          Invocation.method(
            #timerUntilTimestamp,
            [
              timestamp,
              onComplete,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeTimer_2(
          this,
          Invocation.method(
            #timerUntilTimestamp,
            [
              timestamp,
              onComplete,
            ],
          ),
        ),
      ) as _i3.Timer);

  @override
  _i3.Timer timerUntilSlot(
    _i2.Int64? slot,
    void Function()? onComplete,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #timerUntilSlot,
          [
            slot,
            onComplete,
          ],
        ),
        returnValue: _FakeTimer_2(
          this,
          Invocation.method(
            #timerUntilSlot,
            [
              slot,
              onComplete,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeTimer_2(
          this,
          Invocation.method(
            #timerUntilSlot,
            [
              slot,
              onComplete,
            ],
          ),
        ),
      ) as _i3.Timer);

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

  @override
  _i2.Int64 operationalPeriodOfSlot(_i2.Int64? slot) => (super.noSuchMethod(
        Invocation.method(
          #operationalPeriodOfSlot,
          [slot],
        ),
        returnValue: _FakeInt64_1(
          this,
          Invocation.method(
            #operationalPeriodOfSlot,
            [slot],
          ),
        ),
        returnValueForMissingStub: _FakeInt64_1(
          this,
          Invocation.method(
            #operationalPeriodOfSlot,
            [slot],
          ),
        ),
      ) as _i2.Int64);

  @override
  (_i2.Int64, _i2.Int64) operationalPeriodRange(_i2.Int64? operationalPeriod) =>
      (super.noSuchMethod(
        Invocation.method(
          #operationalPeriodRange,
          [operationalPeriod],
        ),
        returnValue: (
          _FakeInt64_1(
            this,
            Invocation.method(
              #operationalPeriodRange,
              [operationalPeriod],
            ),
          ),
          _FakeInt64_1(
            this,
            Invocation.method(
              #operationalPeriodRange,
              [operationalPeriod],
            ),
          )
        ),
        returnValueForMissingStub: (
          _FakeInt64_1(
            this,
            Invocation.method(
              #operationalPeriodRange,
              [operationalPeriod],
            ),
          ),
          _FakeInt64_1(
            this,
            Invocation.method(
              #operationalPeriodRange,
              [operationalPeriod],
            ),
          )
        ),
      ) as (_i2.Int64, _i2.Int64));
}

/// A class which mocks [LeaderElection].
///
/// See the documentation for Mockito's code generation for more information.
class MockLeaderElection extends _i1.Mock implements _i8.LeaderElection {
  @override
  _i3.Future<_i4.Rational> getThreshold(
    _i4.Rational? relativeStake,
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
        returnValue: _i3.Future<_i4.Rational>.value(_FakeRational_3(
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
            _i3.Future<_i4.Rational>.value(_FakeRational_3(
          this,
          Invocation.method(
            #getThreshold,
            [
              relativeStake,
              slotDiff,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Rational>);

  @override
  _i3.Future<bool> isEligible(
    _i4.Rational? threshold,
    List<int>? rho,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #isEligible,
          [
            threshold,
            rho,
          ],
        ),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
