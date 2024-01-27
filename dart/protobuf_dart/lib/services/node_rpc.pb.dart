//
//  Generated code. Do not modify.
//  source: services/node_rpc.proto
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

class BroadcastTransactionReq extends $pb.GeneratedMessage {
  factory BroadcastTransactionReq({
    $5.Transaction? transaction,
  }) {
    final $result = create();
    if (transaction != null) {
      $result.transaction = transaction;
    }
    return $result;
  }
  BroadcastTransactionReq._() : super();
  factory BroadcastTransactionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastTransactionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastTransactionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.Transaction>(1, _omitFieldNames ? '' : 'transaction', subBuilder: $5.Transaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastTransactionReq clone() => BroadcastTransactionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastTransactionReq copyWith(void Function(BroadcastTransactionReq) updates) => super.copyWith((message) => updates(message as BroadcastTransactionReq)) as BroadcastTransactionReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionReq create() => BroadcastTransactionReq._();
  BroadcastTransactionReq createEmptyInstance() => create();
  static $pb.PbList<BroadcastTransactionReq> createRepeated() => $pb.PbList<BroadcastTransactionReq>();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionReq>(create);
  static BroadcastTransactionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction($5.Transaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  $5.Transaction ensureTransaction() => $_ensure(0);
}

class BroadcastTransactionRes extends $pb.GeneratedMessage {
  factory BroadcastTransactionRes() => create();
  BroadcastTransactionRes._() : super();
  factory BroadcastTransactionRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BroadcastTransactionRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BroadcastTransactionRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BroadcastTransactionRes clone() => BroadcastTransactionRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BroadcastTransactionRes copyWith(void Function(BroadcastTransactionRes) updates) => super.copyWith((message) => updates(message as BroadcastTransactionRes)) as BroadcastTransactionRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRes create() => BroadcastTransactionRes._();
  BroadcastTransactionRes createEmptyInstance() => create();
  static $pb.PbList<BroadcastTransactionRes> createRepeated() => $pb.PbList<BroadcastTransactionRes>();
  @$core.pragma('dart2js:noInline')
  static BroadcastTransactionRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BroadcastTransactionRes>(create);
  static BroadcastTransactionRes? _defaultInstance;
}

class GetBlockHeaderReq extends $pb.GeneratedMessage {
  factory GetBlockHeaderReq({
    $5.BlockId? blockId,
  }) {
    final $result = create();
    if (blockId != null) {
      $result.blockId = blockId;
    }
    return $result;
  }
  GetBlockHeaderReq._() : super();
  factory GetBlockHeaderReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockHeaderReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBlockHeaderReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockId>(1, _omitFieldNames ? '' : 'blockId', protoName: 'blockId', subBuilder: $5.BlockId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBlockHeaderReq clone() => GetBlockHeaderReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBlockHeaderReq copyWith(void Function(GetBlockHeaderReq) updates) => super.copyWith((message) => updates(message as GetBlockHeaderReq)) as GetBlockHeaderReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockHeaderReq create() => GetBlockHeaderReq._();
  GetBlockHeaderReq createEmptyInstance() => create();
  static $pb.PbList<GetBlockHeaderReq> createRepeated() => $pb.PbList<GetBlockHeaderReq>();
  @$core.pragma('dart2js:noInline')
  static GetBlockHeaderReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockHeaderReq>(create);
  static GetBlockHeaderReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockId get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($5.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockId ensureBlockId() => $_ensure(0);
}

class GetBlockHeaderRes extends $pb.GeneratedMessage {
  factory GetBlockHeaderRes({
    $5.BlockHeader? header,
  }) {
    final $result = create();
    if (header != null) {
      $result.header = header;
    }
    return $result;
  }
  GetBlockHeaderRes._() : super();
  factory GetBlockHeaderRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockHeaderRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBlockHeaderRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockHeader>(1, _omitFieldNames ? '' : 'header', subBuilder: $5.BlockHeader.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBlockHeaderRes clone() => GetBlockHeaderRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBlockHeaderRes copyWith(void Function(GetBlockHeaderRes) updates) => super.copyWith((message) => updates(message as GetBlockHeaderRes)) as GetBlockHeaderRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockHeaderRes create() => GetBlockHeaderRes._();
  GetBlockHeaderRes createEmptyInstance() => create();
  static $pb.PbList<GetBlockHeaderRes> createRepeated() => $pb.PbList<GetBlockHeaderRes>();
  @$core.pragma('dart2js:noInline')
  static GetBlockHeaderRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockHeaderRes>(create);
  static GetBlockHeaderRes? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header($5.BlockHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockHeader ensureHeader() => $_ensure(0);
}

class GetBlockBodyReq extends $pb.GeneratedMessage {
  factory GetBlockBodyReq({
    $5.BlockId? blockId,
  }) {
    final $result = create();
    if (blockId != null) {
      $result.blockId = blockId;
    }
    return $result;
  }
  GetBlockBodyReq._() : super();
  factory GetBlockBodyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockBodyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBlockBodyReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockId>(1, _omitFieldNames ? '' : 'blockId', protoName: 'blockId', subBuilder: $5.BlockId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBlockBodyReq clone() => GetBlockBodyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBlockBodyReq copyWith(void Function(GetBlockBodyReq) updates) => super.copyWith((message) => updates(message as GetBlockBodyReq)) as GetBlockBodyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockBodyReq create() => GetBlockBodyReq._();
  GetBlockBodyReq createEmptyInstance() => create();
  static $pb.PbList<GetBlockBodyReq> createRepeated() => $pb.PbList<GetBlockBodyReq>();
  @$core.pragma('dart2js:noInline')
  static GetBlockBodyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockBodyReq>(create);
  static GetBlockBodyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockId get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($5.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockId ensureBlockId() => $_ensure(0);
}

class GetBlockBodyRes extends $pb.GeneratedMessage {
  factory GetBlockBodyRes({
    $5.BlockBody? body,
  }) {
    final $result = create();
    if (body != null) {
      $result.body = body;
    }
    return $result;
  }
  GetBlockBodyRes._() : super();
  factory GetBlockBodyRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockBodyRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBlockBodyRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockBody>(1, _omitFieldNames ? '' : 'body', subBuilder: $5.BlockBody.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBlockBodyRes clone() => GetBlockBodyRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBlockBodyRes copyWith(void Function(GetBlockBodyRes) updates) => super.copyWith((message) => updates(message as GetBlockBodyRes)) as GetBlockBodyRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockBodyRes create() => GetBlockBodyRes._();
  GetBlockBodyRes createEmptyInstance() => create();
  static $pb.PbList<GetBlockBodyRes> createRepeated() => $pb.PbList<GetBlockBodyRes>();
  @$core.pragma('dart2js:noInline')
  static GetBlockBodyRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockBodyRes>(create);
  static GetBlockBodyRes? _defaultInstance;

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

class GetFullBlockReq extends $pb.GeneratedMessage {
  factory GetFullBlockReq({
    $5.BlockId? blockId,
  }) {
    final $result = create();
    if (blockId != null) {
      $result.blockId = blockId;
    }
    return $result;
  }
  GetFullBlockReq._() : super();
  factory GetFullBlockReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFullBlockReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFullBlockReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockId>(1, _omitFieldNames ? '' : 'blockId', protoName: 'blockId', subBuilder: $5.BlockId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFullBlockReq clone() => GetFullBlockReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFullBlockReq copyWith(void Function(GetFullBlockReq) updates) => super.copyWith((message) => updates(message as GetFullBlockReq)) as GetFullBlockReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFullBlockReq create() => GetFullBlockReq._();
  GetFullBlockReq createEmptyInstance() => create();
  static $pb.PbList<GetFullBlockReq> createRepeated() => $pb.PbList<GetFullBlockReq>();
  @$core.pragma('dart2js:noInline')
  static GetFullBlockReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFullBlockReq>(create);
  static GetFullBlockReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockId get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($5.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockId ensureBlockId() => $_ensure(0);
}

class GetFullBlockRes extends $pb.GeneratedMessage {
  factory GetFullBlockRes({
    $5.FullBlock? fullBlock,
  }) {
    final $result = create();
    if (fullBlock != null) {
      $result.fullBlock = fullBlock;
    }
    return $result;
  }
  GetFullBlockRes._() : super();
  factory GetFullBlockRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFullBlockRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFullBlockRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.FullBlock>(1, _omitFieldNames ? '' : 'fullBlock', protoName: 'fullBlock', subBuilder: $5.FullBlock.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFullBlockRes clone() => GetFullBlockRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFullBlockRes copyWith(void Function(GetFullBlockRes) updates) => super.copyWith((message) => updates(message as GetFullBlockRes)) as GetFullBlockRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFullBlockRes create() => GetFullBlockRes._();
  GetFullBlockRes createEmptyInstance() => create();
  static $pb.PbList<GetFullBlockRes> createRepeated() => $pb.PbList<GetFullBlockRes>();
  @$core.pragma('dart2js:noInline')
  static GetFullBlockRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFullBlockRes>(create);
  static GetFullBlockRes? _defaultInstance;

  @$pb.TagNumber(1)
  $5.FullBlock get fullBlock => $_getN(0);
  @$pb.TagNumber(1)
  set fullBlock($5.FullBlock v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFullBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearFullBlock() => clearField(1);
  @$pb.TagNumber(1)
  $5.FullBlock ensureFullBlock() => $_ensure(0);
}

class GetTransactionReq extends $pb.GeneratedMessage {
  factory GetTransactionReq({
    $5.TransactionId? transactionId,
  }) {
    final $result = create();
    if (transactionId != null) {
      $result.transactionId = transactionId;
    }
    return $result;
  }
  GetTransactionReq._() : super();
  factory GetTransactionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTransactionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.TransactionId>(1, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId', subBuilder: $5.TransactionId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTransactionReq clone() => GetTransactionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTransactionReq copyWith(void Function(GetTransactionReq) updates) => super.copyWith((message) => updates(message as GetTransactionReq)) as GetTransactionReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransactionReq create() => GetTransactionReq._();
  GetTransactionReq createEmptyInstance() => create();
  static $pb.PbList<GetTransactionReq> createRepeated() => $pb.PbList<GetTransactionReq>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionReq>(create);
  static GetTransactionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $5.TransactionId get transactionId => $_getN(0);
  @$pb.TagNumber(1)
  set transactionId($5.TransactionId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);
  @$pb.TagNumber(1)
  $5.TransactionId ensureTransactionId() => $_ensure(0);
}

class GetTransactionRes extends $pb.GeneratedMessage {
  factory GetTransactionRes({
    $5.Transaction? transaction,
  }) {
    final $result = create();
    if (transaction != null) {
      $result.transaction = transaction;
    }
    return $result;
  }
  GetTransactionRes._() : super();
  factory GetTransactionRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTransactionRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.Transaction>(1, _omitFieldNames ? '' : 'transaction', subBuilder: $5.Transaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTransactionRes clone() => GetTransactionRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTransactionRes copyWith(void Function(GetTransactionRes) updates) => super.copyWith((message) => updates(message as GetTransactionRes)) as GetTransactionRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransactionRes create() => GetTransactionRes._();
  GetTransactionRes createEmptyInstance() => create();
  static $pb.PbList<GetTransactionRes> createRepeated() => $pb.PbList<GetTransactionRes>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionRes>(create);
  static GetTransactionRes? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction($5.Transaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  $5.Transaction ensureTransaction() => $_ensure(0);
}

class FollowReq extends $pb.GeneratedMessage {
  factory FollowReq() => create();
  FollowReq._() : super();
  factory FollowReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FollowReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FollowReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FollowReq clone() => FollowReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FollowReq copyWith(void Function(FollowReq) updates) => super.copyWith((message) => updates(message as FollowReq)) as FollowReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FollowReq create() => FollowReq._();
  FollowReq createEmptyInstance() => create();
  static $pb.PbList<FollowReq> createRepeated() => $pb.PbList<FollowReq>();
  @$core.pragma('dart2js:noInline')
  static FollowReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FollowReq>(create);
  static FollowReq? _defaultInstance;
}

enum FollowRes_Step {
  adopted, 
  unadopted, 
  notSet
}

class FollowRes extends $pb.GeneratedMessage {
  factory FollowRes({
    $5.BlockId? adopted,
    $5.BlockId? unadopted,
  }) {
    final $result = create();
    if (adopted != null) {
      $result.adopted = adopted;
    }
    if (unadopted != null) {
      $result.unadopted = unadopted;
    }
    return $result;
  }
  FollowRes._() : super();
  factory FollowRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FollowRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, FollowRes_Step> _FollowRes_StepByTag = {
    1 : FollowRes_Step.adopted,
    2 : FollowRes_Step.unadopted,
    0 : FollowRes_Step.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FollowRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$5.BlockId>(1, _omitFieldNames ? '' : 'adopted', subBuilder: $5.BlockId.create)
    ..aOM<$5.BlockId>(2, _omitFieldNames ? '' : 'unadopted', subBuilder: $5.BlockId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FollowRes clone() => FollowRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FollowRes copyWith(void Function(FollowRes) updates) => super.copyWith((message) => updates(message as FollowRes)) as FollowRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FollowRes create() => FollowRes._();
  FollowRes createEmptyInstance() => create();
  static $pb.PbList<FollowRes> createRepeated() => $pb.PbList<FollowRes>();
  @$core.pragma('dart2js:noInline')
  static FollowRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FollowRes>(create);
  static FollowRes? _defaultInstance;

  FollowRes_Step whichStep() => _FollowRes_StepByTag[$_whichOneof(0)]!;
  void clearStep() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $5.BlockId get adopted => $_getN(0);
  @$pb.TagNumber(1)
  set adopted($5.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdopted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdopted() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockId ensureAdopted() => $_ensure(0);

  @$pb.TagNumber(2)
  $5.BlockId get unadopted => $_getN(1);
  @$pb.TagNumber(2)
  set unadopted($5.BlockId v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnadopted() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnadopted() => clearField(2);
  @$pb.TagNumber(2)
  $5.BlockId ensureUnadopted() => $_ensure(1);
}

class GetBlockIdAtHeightReq extends $pb.GeneratedMessage {
  factory GetBlockIdAtHeightReq({
    $fixnum.Int64? height,
  }) {
    final $result = create();
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  GetBlockIdAtHeightReq._() : super();
  factory GetBlockIdAtHeightReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockIdAtHeightReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBlockIdAtHeightReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'height')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBlockIdAtHeightReq clone() => GetBlockIdAtHeightReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBlockIdAtHeightReq copyWith(void Function(GetBlockIdAtHeightReq) updates) => super.copyWith((message) => updates(message as GetBlockIdAtHeightReq)) as GetBlockIdAtHeightReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockIdAtHeightReq create() => GetBlockIdAtHeightReq._();
  GetBlockIdAtHeightReq createEmptyInstance() => create();
  static $pb.PbList<GetBlockIdAtHeightReq> createRepeated() => $pb.PbList<GetBlockIdAtHeightReq>();
  @$core.pragma('dart2js:noInline')
  static GetBlockIdAtHeightReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockIdAtHeightReq>(create);
  static GetBlockIdAtHeightReq? _defaultInstance;

  /// Non-positive value -> Depth
  /// i.e. `0` returns canonical head, `-1` returns canonical head's parent
  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);
}

class GetBlockIdAtHeightRes extends $pb.GeneratedMessage {
  factory GetBlockIdAtHeightRes({
    $5.BlockId? blockId,
  }) {
    final $result = create();
    if (blockId != null) {
      $result.blockId = blockId;
    }
    return $result;
  }
  GetBlockIdAtHeightRes._() : super();
  factory GetBlockIdAtHeightRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockIdAtHeightRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBlockIdAtHeightRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOM<$5.BlockId>(1, _omitFieldNames ? '' : 'blockId', protoName: 'blockId', subBuilder: $5.BlockId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBlockIdAtHeightRes clone() => GetBlockIdAtHeightRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBlockIdAtHeightRes copyWith(void Function(GetBlockIdAtHeightRes) updates) => super.copyWith((message) => updates(message as GetBlockIdAtHeightRes)) as GetBlockIdAtHeightRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockIdAtHeightRes create() => GetBlockIdAtHeightRes._();
  GetBlockIdAtHeightRes createEmptyInstance() => create();
  static $pb.PbList<GetBlockIdAtHeightRes> createRepeated() => $pb.PbList<GetBlockIdAtHeightRes>();
  @$core.pragma('dart2js:noInline')
  static GetBlockIdAtHeightRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockIdAtHeightRes>(create);
  static GetBlockIdAtHeightRes? _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockId get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($5.BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockId ensureBlockId() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
