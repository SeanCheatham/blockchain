//
//  Generated code. Do not modify.
//  source: services/staker_support_rpc.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../models/core.pb.dart' as $5;

class BroadcastBlockReq extends $pb.GeneratedMessage {
  factory BroadcastBlockReq({
    $5.Block? block,
    $5.Transaction? rewardTransaction,
  }) {
    final $result = create();
    if (block != null) {
      $result.block = block;
    }
    if (rewardTransaction != null) {
      $result.rewardTransaction = rewardTransaction;
    }
    return $result;
  }
  BroadcastBlockReq._() : super();
  factory BroadcastBlockReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastBlockReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastBlockReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.Block>(1, _omitFieldNames ? '' : 'block', subBuilder: $5.Block.create)
    ..aOM<$5.Transaction>(2, _omitFieldNames ? '' : 'rewardTransaction', protoName: 'rewardTransaction', subBuilder: $5.Transaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastBlockReq clone() => BroadcastBlockReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastBlockReq copyWith(void Function(BroadcastBlockReq) updates) => super.copyWith((message) => updates(message as BroadcastBlockReq)) as BroadcastBlockReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastBlockReq create() => BroadcastBlockReq._();
  BroadcastBlockReq createEmptyInstance() => create();
  static $pb.PbList<BroadcastBlockReq> createRepeated() => $pb.PbList<BroadcastBlockReq>();
  @$core.pragma('dart2js:noInline')
  static BroadcastBlockReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastBlockReq>(create);
  static BroadcastBlockReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Block get block => $_getN(0);
  @$pb.TagNumber(1)
  set block($5.Block v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlock() => clearField(1);
  @$pb.TagNumber(1)
  $5.Block ensureBlock() => $_ensure(0);

  @$pb.TagNumber(2)
  $5.Transaction get rewardTransaction => $_getN(1);
  @$pb.TagNumber(2)
  set rewardTransaction($5.Transaction v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRewardTransaction() => $_has(1);
  @$pb.TagNumber(2)
  void clearRewardTransaction() => clearField(2);
  @$pb.TagNumber(2)
  $5.Transaction ensureRewardTransaction() => $_ensure(1);
}

class BroadcastBlockRes extends $pb.GeneratedMessage {
  factory BroadcastBlockRes() => create();
  BroadcastBlockRes._() : super();
  factory BroadcastBlockRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastBlockRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastBlockRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastBlockRes clone() => BroadcastBlockRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastBlockRes copyWith(void Function(BroadcastBlockRes) updates) => super.copyWith((message) => updates(message as BroadcastBlockRes)) as BroadcastBlockRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastBlockRes create() => BroadcastBlockRes._();
  BroadcastBlockRes createEmptyInstance() => create();
  static $pb.PbList<BroadcastBlockRes> createRepeated() => $pb.PbList<BroadcastBlockRes>();
  @$core.pragma('dart2js:noInline')
  static BroadcastBlockRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastBlockRes>(create);
  static BroadcastBlockRes? _defaultInstance;
}

class GetStakerReq extends $pb.GeneratedMessage {
  factory GetStakerReq({
    $5.TransactionOutputReference? stakingAccount,
    $5.BlockId? parentBlockId,
    $fixnum.Int64? slot,
  }) {
    final $result = create();
    if (stakingAccount != null) {
      $result.stakingAccount = stakingAccount;
    }
    if (parentBlockId != null) {
      $result.parentBlockId = parentBlockId;
    }
    if (slot != null) {
      $result.slot = slot;
    }
    return $result;
  }
  GetStakerReq._() : super();
  factory GetStakerReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStakerReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStakerReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.TransactionOutputReference>(1, _omitFieldNames ? '' : 'stakingAccount', protoName: 'stakingAccount', subBuilder: $5.TransactionOutputReference.create)
    ..aOM<$5.BlockId>(2, _omitFieldNames ? '' : 'parentBlockId', protoName: 'parentBlockId', subBuilder: $5.BlockId.create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStakerReq clone() => GetStakerReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStakerReq copyWith(void Function(GetStakerReq) updates) => super.copyWith((message) => updates(message as GetStakerReq)) as GetStakerReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStakerReq create() => GetStakerReq._();
  GetStakerReq createEmptyInstance() => create();
  static $pb.PbList<GetStakerReq> createRepeated() => $pb.PbList<GetStakerReq>();
  @$core.pragma('dart2js:noInline')
  static GetStakerReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStakerReq>(create);
  static GetStakerReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.TransactionOutputReference get stakingAccount => $_getN(0);
  @$pb.TagNumber(1)
  set stakingAccount($5.TransactionOutputReference v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStakingAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearStakingAccount() => clearField(1);
  @$pb.TagNumber(1)
  $5.TransactionOutputReference ensureStakingAccount() => $_ensure(0);

  @$pb.TagNumber(2)
  $5.BlockId get parentBlockId => $_getN(1);
  @$pb.TagNumber(2)
  set parentBlockId($5.BlockId v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentBlockId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentBlockId() => clearField(2);
  @$pb.TagNumber(2)
  $5.BlockId ensureParentBlockId() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get slot => $_getI64(2);
  @$pb.TagNumber(3)
  set slot($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSlot() => $_has(2);
  @$pb.TagNumber(3)
  void clearSlot() => clearField(3);
}

class GetStakerRes extends $pb.GeneratedMessage {
  factory GetStakerRes({
    $5.ActiveStaker? staker,
  }) {
    final $result = create();
    if (staker != null) {
      $result.staker = staker;
    }
    return $result;
  }
  GetStakerRes._() : super();
  factory GetStakerRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStakerRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStakerRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.ActiveStaker>(1, _omitFieldNames ? '' : 'staker', subBuilder: $5.ActiveStaker.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStakerRes clone() => GetStakerRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStakerRes copyWith(void Function(GetStakerRes) updates) => super.copyWith((message) => updates(message as GetStakerRes)) as GetStakerRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStakerRes create() => GetStakerRes._();
  GetStakerRes createEmptyInstance() => create();
  static $pb.PbList<GetStakerRes> createRepeated() => $pb.PbList<GetStakerRes>();
  @$core.pragma('dart2js:noInline')
  static GetStakerRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStakerRes>(create);
  static GetStakerRes? _defaultInstance;

  @$pb.TagNumber(1)
  $5.ActiveStaker get staker => $_getN(0);
  @$pb.TagNumber(1)
  set staker($5.ActiveStaker v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStaker() => $_has(0);
  @$pb.TagNumber(1)
  void clearStaker() => clearField(1);
  @$pb.TagNumber(1)
  $5.ActiveStaker ensureStaker() => $_ensure(0);
}

class GetTotalActiveStakeReq extends $pb.GeneratedMessage {
  factory GetTotalActiveStakeReq({
    $5.BlockId? parentBlockId,
    $fixnum.Int64? slot,
  }) {
    final $result = create();
    if (parentBlockId != null) {
      $result.parentBlockId = parentBlockId;
    }
    if (slot != null) {
      $result.slot = slot;
    }
    return $result;
  }
  GetTotalActiveStakeReq._() : super();
  factory GetTotalActiveStakeReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTotalActiveStakeReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTotalActiveStakeReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockId>(1, _omitFieldNames ? '' : 'parentBlockId', protoName: 'parentBlockId', subBuilder: $5.BlockId.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTotalActiveStakeReq clone() => GetTotalActiveStakeReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTotalActiveStakeReq copyWith(void Function(GetTotalActiveStakeReq) updates) => super.copyWith((message) => updates(message as GetTotalActiveStakeReq)) as GetTotalActiveStakeReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTotalActiveStakeReq create() => GetTotalActiveStakeReq._();
  GetTotalActiveStakeReq createEmptyInstance() => create();
  static $pb.PbList<GetTotalActiveStakeReq> createRepeated() => $pb.PbList<GetTotalActiveStakeReq>();
  @$core.pragma('dart2js:noInline')
  static GetTotalActiveStakeReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTotalActiveStakeReq>(create);
  static GetTotalActiveStakeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockId get parentBlockId => $_getN(0);
  @$pb.TagNumber(1)
  set parentBlockId($5.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParentBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentBlockId() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockId ensureParentBlockId() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get slot => $_getI64(1);
  @$pb.TagNumber(2)
  set slot($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlot() => clearField(2);
}

class GetTotalActiveStakeRes extends $pb.GeneratedMessage {
  factory GetTotalActiveStakeRes({
    $fixnum.Int64? totalActiveStake,
  }) {
    final $result = create();
    if (totalActiveStake != null) {
      $result.totalActiveStake = totalActiveStake;
    }
    return $result;
  }
  GetTotalActiveStakeRes._() : super();
  factory GetTotalActiveStakeRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTotalActiveStakeRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTotalActiveStakeRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalActiveStake', protoName: 'totalActiveStake')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTotalActiveStakeRes clone() => GetTotalActiveStakeRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTotalActiveStakeRes copyWith(void Function(GetTotalActiveStakeRes) updates) => super.copyWith((message) => updates(message as GetTotalActiveStakeRes)) as GetTotalActiveStakeRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTotalActiveStakeRes create() => GetTotalActiveStakeRes._();
  GetTotalActiveStakeRes createEmptyInstance() => create();
  static $pb.PbList<GetTotalActiveStakeRes> createRepeated() => $pb.PbList<GetTotalActiveStakeRes>();
  @$core.pragma('dart2js:noInline')
  static GetTotalActiveStakeRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTotalActiveStakeRes>(create);
  static GetTotalActiveStakeRes? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalActiveStake => $_getI64(0);
  @$pb.TagNumber(1)
  set totalActiveStake($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalActiveStake() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalActiveStake() => clearField(1);
}

class CalculateEtaReq extends $pb.GeneratedMessage {
  factory CalculateEtaReq({
    $5.BlockId? parentBlockId,
    $fixnum.Int64? slot,
  }) {
    final $result = create();
    if (parentBlockId != null) {
      $result.parentBlockId = parentBlockId;
    }
    if (slot != null) {
      $result.slot = slot;
    }
    return $result;
  }
  CalculateEtaReq._() : super();
  factory CalculateEtaReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalculateEtaReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalculateEtaReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockId>(1, _omitFieldNames ? '' : 'parentBlockId', protoName: 'parentBlockId', subBuilder: $5.BlockId.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalculateEtaReq clone() => CalculateEtaReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalculateEtaReq copyWith(void Function(CalculateEtaReq) updates) => super.copyWith((message) => updates(message as CalculateEtaReq)) as CalculateEtaReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalculateEtaReq create() => CalculateEtaReq._();
  CalculateEtaReq createEmptyInstance() => create();
  static $pb.PbList<CalculateEtaReq> createRepeated() => $pb.PbList<CalculateEtaReq>();
  @$core.pragma('dart2js:noInline')
  static CalculateEtaReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalculateEtaReq>(create);
  static CalculateEtaReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockId get parentBlockId => $_getN(0);
  @$pb.TagNumber(1)
  set parentBlockId($5.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParentBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentBlockId() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockId ensureParentBlockId() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get slot => $_getI64(1);
  @$pb.TagNumber(2)
  set slot($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlot() => clearField(2);
}

class CalculateEtaRes extends $pb.GeneratedMessage {
  factory CalculateEtaRes({
    $core.List<$core.int>? eta,
  }) {
    final $result = create();
    if (eta != null) {
      $result.eta = eta;
    }
    return $result;
  }
  CalculateEtaRes._() : super();
  factory CalculateEtaRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalculateEtaRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalculateEtaRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'eta', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalculateEtaRes clone() => CalculateEtaRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalculateEtaRes copyWith(void Function(CalculateEtaRes) updates) => super.copyWith((message) => updates(message as CalculateEtaRes)) as CalculateEtaRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalculateEtaRes create() => CalculateEtaRes._();
  CalculateEtaRes createEmptyInstance() => create();
  static $pb.PbList<CalculateEtaRes> createRepeated() => $pb.PbList<CalculateEtaRes>();
  @$core.pragma('dart2js:noInline')
  static CalculateEtaRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalculateEtaRes>(create);
  static CalculateEtaRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get eta => $_getN(0);
  @$pb.TagNumber(1)
  set eta($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEta() => $_has(0);
  @$pb.TagNumber(1)
  void clearEta() => clearField(1);
}

class PackBlockReq extends $pb.GeneratedMessage {
  factory PackBlockReq({
    $5.BlockId? parentBlockId,
    $fixnum.Int64? untilSlot,
  }) {
    final $result = create();
    if (parentBlockId != null) {
      $result.parentBlockId = parentBlockId;
    }
    if (untilSlot != null) {
      $result.untilSlot = untilSlot;
    }
    return $result;
  }
  PackBlockReq._() : super();
  factory PackBlockReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PackBlockReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PackBlockReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockId>(1, _omitFieldNames ? '' : 'parentBlockId', protoName: 'parentBlockId', subBuilder: $5.BlockId.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'untilSlot', $pb.PbFieldType.OU6, protoName: 'untilSlot', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PackBlockReq clone() => PackBlockReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PackBlockReq copyWith(void Function(PackBlockReq) updates) => super.copyWith((message) => updates(message as PackBlockReq)) as PackBlockReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PackBlockReq create() => PackBlockReq._();
  PackBlockReq createEmptyInstance() => create();
  static $pb.PbList<PackBlockReq> createRepeated() => $pb.PbList<PackBlockReq>();
  @$core.pragma('dart2js:noInline')
  static PackBlockReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PackBlockReq>(create);
  static PackBlockReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockId get parentBlockId => $_getN(0);
  @$pb.TagNumber(1)
  set parentBlockId($5.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParentBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentBlockId() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockId ensureParentBlockId() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get untilSlot => $_getI64(1);
  @$pb.TagNumber(2)
  set untilSlot($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUntilSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearUntilSlot() => clearField(2);
}

class PackBlockRes extends $pb.GeneratedMessage {
  factory PackBlockRes({
    $5.BlockBody? body,
  }) {
    final $result = create();
    if (body != null) {
      $result.body = body;
    }
    return $result;
  }
  PackBlockRes._() : super();
  factory PackBlockRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PackBlockRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PackBlockRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockBody>(1, _omitFieldNames ? '' : 'body', subBuilder: $5.BlockBody.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PackBlockRes clone() => PackBlockRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PackBlockRes copyWith(void Function(PackBlockRes) updates) => super.copyWith((message) => updates(message as PackBlockRes)) as PackBlockRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PackBlockRes create() => PackBlockRes._();
  PackBlockRes createEmptyInstance() => create();
  static $pb.PbList<PackBlockRes> createRepeated() => $pb.PbList<PackBlockRes>();
  @$core.pragma('dart2js:noInline')
  static PackBlockRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PackBlockRes>(create);
  static PackBlockRes? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockBody get body => $_getN(0);
  @$pb.TagNumber(1)
  set body($5.BlockBody v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBody() => $_has(0);
  @$pb.TagNumber(1)
  void clearBody() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockBody ensureBody() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
