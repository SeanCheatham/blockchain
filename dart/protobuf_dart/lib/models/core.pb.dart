//
//  Generated code. Do not modify.
//  source: models/core.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/struct.pb.dart' as $3;
import '../google/protobuf/wrappers.pb.dart' as $4;

class BlockId extends $pb.GeneratedMessage {
  factory BlockId({
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  BlockId._() : super();
  factory BlockId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockId', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockId clone() => BlockId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockId copyWith(void Function(BlockId) updates) => super.copyWith((message) => updates(message as BlockId)) as BlockId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockId create() => BlockId._();
  BlockId createEmptyInstance() => create();
  static $pb.PbList<BlockId> createRepeated() => $pb.PbList<BlockId>();
  @$core.pragma('dart2js:noInline')
  static BlockId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockId>(create);
  static BlockId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

/// Captures a block producer's consensus-commitment to a new block
class BlockHeader extends $pb.GeneratedMessage {
  factory BlockHeader({
    BlockId? parentHeaderId,
    $fixnum.Int64? parentSlot,
    $core.List<$core.int>? txRoot,
    $fixnum.Int64? timestamp,
    $fixnum.Int64? height,
    $fixnum.Int64? slot,
    EligibilityCertificate? eligibilityCertificate,
    OperationalCertificate? operationalCertificate,
    $core.List<$core.int>? metadata,
    TransactionOutputReference? account,
    $core.Map<$core.String, $core.String>? settings,
    BlockId? headerId,
  }) {
    final $result = create();
    if (parentHeaderId != null) {
      $result.parentHeaderId = parentHeaderId;
    }
    if (parentSlot != null) {
      $result.parentSlot = parentSlot;
    }
    if (txRoot != null) {
      $result.txRoot = txRoot;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (height != null) {
      $result.height = height;
    }
    if (slot != null) {
      $result.slot = slot;
    }
    if (eligibilityCertificate != null) {
      $result.eligibilityCertificate = eligibilityCertificate;
    }
    if (operationalCertificate != null) {
      $result.operationalCertificate = operationalCertificate;
    }
    if (metadata != null) {
      $result.metadata = metadata;
    }
    if (account != null) {
      $result.account = account;
    }
    if (settings != null) {
      $result.settings.addAll(settings);
    }
    if (headerId != null) {
      $result.headerId = headerId;
    }
    return $result;
  }
  BlockHeader._() : super();
  factory BlockHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockHeader', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<BlockId>(1, _omitFieldNames ? '' : 'parentHeaderId', protoName: 'parentHeaderId', subBuilder: BlockId.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'parentSlot', $pb.PbFieldType.OU6, protoName: 'parentSlot', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'txRoot', $pb.PbFieldType.OY, protoName: 'txRoot')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'timestamp', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<EligibilityCertificate>(7, _omitFieldNames ? '' : 'eligibilityCertificate', protoName: 'eligibilityCertificate', subBuilder: EligibilityCertificate.create)
    ..aOM<OperationalCertificate>(8, _omitFieldNames ? '' : 'operationalCertificate', protoName: 'operationalCertificate', subBuilder: OperationalCertificate.create)
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'metadata', $pb.PbFieldType.OY)
    ..aOM<TransactionOutputReference>(10, _omitFieldNames ? '' : 'account', subBuilder: TransactionOutputReference.create)
    ..m<$core.String, $core.String>(11, _omitFieldNames ? '' : 'settings', entryClassName: 'BlockHeader.SettingsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('blockchain.models'))
    ..aOM<BlockId>(12, _omitFieldNames ? '' : 'headerId', protoName: 'headerId', subBuilder: BlockId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockHeader clone() => BlockHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockHeader copyWith(void Function(BlockHeader) updates) => super.copyWith((message) => updates(message as BlockHeader)) as BlockHeader;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockHeader create() => BlockHeader._();
  BlockHeader createEmptyInstance() => create();
  static $pb.PbList<BlockHeader> createRepeated() => $pb.PbList<BlockHeader>();
  @$core.pragma('dart2js:noInline')
  static BlockHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockHeader>(create);
  static BlockHeader? _defaultInstance;

  /// The parent block's ID.  Each header builds from a single parent.
  @$pb.TagNumber(1)
  BlockId get parentHeaderId => $_getN(0);
  @$pb.TagNumber(1)
  set parentHeaderId(BlockId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParentHeaderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentHeaderId() => clearField(1);
  @$pb.TagNumber(1)
  BlockId ensureParentHeaderId() => $_ensure(0);

  /// The slot of the parent block
  @$pb.TagNumber(2)
  $fixnum.Int64 get parentSlot => $_getI64(1);
  @$pb.TagNumber(2)
  set parentSlot($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentSlot() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentSlot() => clearField(2);

  /// The commitment/accumulator of the block body
  /// length = 32
  @$pb.TagNumber(3)
  $core.List<$core.int> get txRoot => $_getN(2);
  @$pb.TagNumber(3)
  set txRoot($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTxRoot() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxRoot() => clearField(3);

  /// The UTC UNIX timestamp (ms) when the block was created
  @$pb.TagNumber(4)
  $fixnum.Int64 get timestamp => $_getI64(3);
  @$pb.TagNumber(4)
  set timestamp($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);

  /// The 1-based index of this block in the blockchain
  @$pb.TagNumber(5)
  $fixnum.Int64 get height => $_getI64(4);
  @$pb.TagNumber(5)
  set height($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  /// The time-slot in which the block producer created the block
  @$pb.TagNumber(6)
  $fixnum.Int64 get slot => $_getI64(5);
  @$pb.TagNumber(6)
  set slot($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSlot() => $_has(5);
  @$pb.TagNumber(6)
  void clearSlot() => clearField(6);

  /// A certificate indicating that the block producer was eligible to make this block
  @$pb.TagNumber(7)
  EligibilityCertificate get eligibilityCertificate => $_getN(6);
  @$pb.TagNumber(7)
  set eligibilityCertificate(EligibilityCertificate v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEligibilityCertificate() => $_has(6);
  @$pb.TagNumber(7)
  void clearEligibilityCertificate() => clearField(7);
  @$pb.TagNumber(7)
  EligibilityCertificate ensureEligibilityCertificate() => $_ensure(6);

  /// A certificate indicating the operator's commitment to this block
  @$pb.TagNumber(8)
  OperationalCertificate get operationalCertificate => $_getN(7);
  @$pb.TagNumber(8)
  set operationalCertificate(OperationalCertificate v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasOperationalCertificate() => $_has(7);
  @$pb.TagNumber(8)
  void clearOperationalCertificate() => clearField(8);
  @$pb.TagNumber(8)
  OperationalCertificate ensureOperationalCertificate() => $_ensure(7);

  /// Optional metadata stamped by the operator.  Must be latin-1 encoded, and must be at most 32 bytes in length.
  /// optional
  @$pb.TagNumber(9)
  $core.List<$core.int> get metadata => $_getN(8);
  @$pb.TagNumber(9)
  set metadata($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMetadata() => $_has(8);
  @$pb.TagNumber(9)
  void clearMetadata() => clearField(9);

  /// The operator's staking account location
  @$pb.TagNumber(10)
  TransactionOutputReference get account => $_getN(9);
  @$pb.TagNumber(10)
  set account(TransactionOutputReference v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAccount() => $_has(9);
  @$pb.TagNumber(10)
  void clearAccount() => clearField(10);
  @$pb.TagNumber(10)
  TransactionOutputReference ensureAccount() => $_ensure(9);

  /// Configuration or protocol changes
  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get settings => $_getMap(10);

  /// The ID of _this_ block header.  This value is optional and its contents are not included in the signable or identifiable data.  Clients which _can_ verify
  /// this value should verify this value, but some clients may not be able to or need to, in which case this field acts as a convenience.
  @$pb.TagNumber(12)
  BlockId get headerId => $_getN(11);
  @$pb.TagNumber(12)
  set headerId(BlockId v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasHeaderId() => $_has(11);
  @$pb.TagNumber(12)
  void clearHeaderId() => clearField(12);
  @$pb.TagNumber(12)
  BlockId ensureHeaderId() => $_ensure(11);
}

/// A certificate proving the operator's election
class EligibilityCertificate extends $pb.GeneratedMessage {
  factory EligibilityCertificate({
    $core.List<$core.int>? vrfSig,
    $core.List<$core.int>? vrfVK,
    $core.List<$core.int>? thresholdEvidence,
    $core.List<$core.int>? eta,
  }) {
    final $result = create();
    if (vrfSig != null) {
      $result.vrfSig = vrfSig;
    }
    if (vrfVK != null) {
      $result.vrfVK = vrfVK;
    }
    if (thresholdEvidence != null) {
      $result.thresholdEvidence = thresholdEvidence;
    }
    if (eta != null) {
      $result.eta = eta;
    }
    return $result;
  }
  EligibilityCertificate._() : super();
  factory EligibilityCertificate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EligibilityCertificate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EligibilityCertificate', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'vrfSig', $pb.PbFieldType.OY, protoName: 'vrfSig')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'vrfVK', $pb.PbFieldType.OY, protoName: 'vrfVK')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'thresholdEvidence', $pb.PbFieldType.OY, protoName: 'thresholdEvidence')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'eta', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EligibilityCertificate clone() => EligibilityCertificate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EligibilityCertificate copyWith(void Function(EligibilityCertificate) updates) => super.copyWith((message) => updates(message as EligibilityCertificate)) as EligibilityCertificate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EligibilityCertificate create() => EligibilityCertificate._();
  EligibilityCertificate createEmptyInstance() => create();
  static $pb.PbList<EligibilityCertificate> createRepeated() => $pb.PbList<EligibilityCertificate>();
  @$core.pragma('dart2js:noInline')
  static EligibilityCertificate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EligibilityCertificate>(create);
  static EligibilityCertificate? _defaultInstance;

  /// Signs `eta ++ slot` using the `vrfSK`
  @$pb.TagNumber(1)
  $core.List<$core.int> get vrfSig => $_getN(0);
  @$pb.TagNumber(1)
  set vrfSig($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVrfSig() => $_has(0);
  @$pb.TagNumber(1)
  void clearVrfSig() => clearField(1);

  /// The VRF VK
  @$pb.TagNumber(2)
  $core.List<$core.int> get vrfVK => $_getN(1);
  @$pb.TagNumber(2)
  set vrfVK($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVrfVK() => $_has(1);
  @$pb.TagNumber(2)
  void clearVrfVK() => clearField(2);

  /// Hash of the operator's `threshold`
  /// routine = blake2b256
  /// length = 32
  @$pb.TagNumber(3)
  $core.List<$core.int> get thresholdEvidence => $_getN(2);
  @$pb.TagNumber(3)
  set thresholdEvidence($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasThresholdEvidence() => $_has(2);
  @$pb.TagNumber(3)
  void clearThresholdEvidence() => clearField(3);

  /// The epoch's randomness
  /// length = 32
  @$pb.TagNumber(4)
  $core.List<$core.int> get eta => $_getN(3);
  @$pb.TagNumber(4)
  set eta($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEta() => $_has(3);
  @$pb.TagNumber(4)
  void clearEta() => clearField(4);
}

/// A certificate which commits an operator to a linear key, which is then used to sign the block
class OperationalCertificate extends $pb.GeneratedMessage {
  factory OperationalCertificate({
    VerificationKeyKesProduct? parentVK,
    SignatureKesProduct? parentSignature,
    $core.List<$core.int>? childVK,
    $core.List<$core.int>? childSignature,
  }) {
    final $result = create();
    if (parentVK != null) {
      $result.parentVK = parentVK;
    }
    if (parentSignature != null) {
      $result.parentSignature = parentSignature;
    }
    if (childVK != null) {
      $result.childVK = childVK;
    }
    if (childSignature != null) {
      $result.childSignature = childSignature;
    }
    return $result;
  }
  OperationalCertificate._() : super();
  factory OperationalCertificate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OperationalCertificate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OperationalCertificate', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<VerificationKeyKesProduct>(1, _omitFieldNames ? '' : 'parentVK', protoName: 'parentVK', subBuilder: VerificationKeyKesProduct.create)
    ..aOM<SignatureKesProduct>(2, _omitFieldNames ? '' : 'parentSignature', protoName: 'parentSignature', subBuilder: SignatureKesProduct.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'childVK', $pb.PbFieldType.OY, protoName: 'childVK')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'childSignature', $pb.PbFieldType.OY, protoName: 'childSignature')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OperationalCertificate clone() => OperationalCertificate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OperationalCertificate copyWith(void Function(OperationalCertificate) updates) => super.copyWith((message) => updates(message as OperationalCertificate)) as OperationalCertificate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OperationalCertificate create() => OperationalCertificate._();
  OperationalCertificate createEmptyInstance() => create();
  static $pb.PbList<OperationalCertificate> createRepeated() => $pb.PbList<OperationalCertificate>();
  @$core.pragma('dart2js:noInline')
  static OperationalCertificate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OperationalCertificate>(create);
  static OperationalCertificate? _defaultInstance;

  /// The KES VK of the parent key (forward-secure) (hour+minute hands)
  @$pb.TagNumber(1)
  VerificationKeyKesProduct get parentVK => $_getN(0);
  @$pb.TagNumber(1)
  set parentVK(VerificationKeyKesProduct v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParentVK() => $_has(0);
  @$pb.TagNumber(1)
  void clearParentVK() => clearField(1);
  @$pb.TagNumber(1)
  VerificationKeyKesProduct ensureParentVK() => $_ensure(0);

  /// Signs the `childVK` using the `parentSK`
  @$pb.TagNumber(2)
  SignatureKesProduct get parentSignature => $_getN(1);
  @$pb.TagNumber(2)
  set parentSignature(SignatureKesProduct v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentSignature() => clearField(2);
  @$pb.TagNumber(2)
  SignatureKesProduct ensureParentSignature() => $_ensure(1);

  /// The linear VK
  @$pb.TagNumber(3)
  $core.List<$core.int> get childVK => $_getN(2);
  @$pb.TagNumber(3)
  set childVK($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChildVK() => $_has(2);
  @$pb.TagNumber(3)
  void clearChildVK() => clearField(3);

  /// The signature of the block
  @$pb.TagNumber(4)
  $core.List<$core.int> get childSignature => $_getN(3);
  @$pb.TagNumber(4)
  set childSignature($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChildSignature() => $_has(3);
  @$pb.TagNumber(4)
  void clearChildSignature() => clearField(4);
}

class VerificationKeyKesProduct extends $pb.GeneratedMessage {
  factory VerificationKeyKesProduct({
    $core.List<$core.int>? value,
    $core.int? step,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    if (step != null) {
      $result.step = step;
    }
    return $result;
  }
  VerificationKeyKesProduct._() : super();
  factory VerificationKeyKesProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerificationKeyKesProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VerificationKeyKesProduct', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'step', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerificationKeyKesProduct clone() => VerificationKeyKesProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerificationKeyKesProduct copyWith(void Function(VerificationKeyKesProduct) updates) => super.copyWith((message) => updates(message as VerificationKeyKesProduct)) as VerificationKeyKesProduct;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerificationKeyKesProduct create() => VerificationKeyKesProduct._();
  VerificationKeyKesProduct createEmptyInstance() => create();
  static $pb.PbList<VerificationKeyKesProduct> createRepeated() => $pb.PbList<VerificationKeyKesProduct>();
  @$core.pragma('dart2js:noInline')
  static VerificationKeyKesProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerificationKeyKesProduct>(create);
  static VerificationKeyKesProduct? _defaultInstance;

  /// length = 32
  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get step => $_getIZ(1);
  @$pb.TagNumber(2)
  set step($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStep() => $_has(1);
  @$pb.TagNumber(2)
  void clearStep() => clearField(2);
}

class SignatureKesSum extends $pb.GeneratedMessage {
  factory SignatureKesSum({
    $core.List<$core.int>? verificationKey,
    $core.List<$core.int>? signature,
    $core.Iterable<$core.List<$core.int>>? witness,
  }) {
    final $result = create();
    if (verificationKey != null) {
      $result.verificationKey = verificationKey;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    if (witness != null) {
      $result.witness.addAll(witness);
    }
    return $result;
  }
  SignatureKesSum._() : super();
  factory SignatureKesSum.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignatureKesSum.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignatureKesSum', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'verificationKey', $pb.PbFieldType.OY, protoName: 'verificationKey')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'witness', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignatureKesSum clone() => SignatureKesSum()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignatureKesSum copyWith(void Function(SignatureKesSum) updates) => super.copyWith((message) => updates(message as SignatureKesSum)) as SignatureKesSum;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignatureKesSum create() => SignatureKesSum._();
  SignatureKesSum createEmptyInstance() => create();
  static $pb.PbList<SignatureKesSum> createRepeated() => $pb.PbList<SignatureKesSum>();
  @$core.pragma('dart2js:noInline')
  static SignatureKesSum getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignatureKesSum>(create);
  static SignatureKesSum? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get verificationKey => $_getN(0);
  @$pb.TagNumber(1)
  set verificationKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVerificationKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerificationKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);

  /// item length = 32
  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get witness => $_getList(2);
}

class SignatureKesProduct extends $pb.GeneratedMessage {
  factory SignatureKesProduct({
    SignatureKesSum? superSignature,
    SignatureKesSum? subSignature,
    $core.List<$core.int>? subRoot,
  }) {
    final $result = create();
    if (superSignature != null) {
      $result.superSignature = superSignature;
    }
    if (subSignature != null) {
      $result.subSignature = subSignature;
    }
    if (subRoot != null) {
      $result.subRoot = subRoot;
    }
    return $result;
  }
  SignatureKesProduct._() : super();
  factory SignatureKesProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignatureKesProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignatureKesProduct', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<SignatureKesSum>(1, _omitFieldNames ? '' : 'superSignature', protoName: 'superSignature', subBuilder: SignatureKesSum.create)
    ..aOM<SignatureKesSum>(2, _omitFieldNames ? '' : 'subSignature', protoName: 'subSignature', subBuilder: SignatureKesSum.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'subRoot', $pb.PbFieldType.OY, protoName: 'subRoot')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignatureKesProduct clone() => SignatureKesProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignatureKesProduct copyWith(void Function(SignatureKesProduct) updates) => super.copyWith((message) => updates(message as SignatureKesProduct)) as SignatureKesProduct;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignatureKesProduct create() => SignatureKesProduct._();
  SignatureKesProduct createEmptyInstance() => create();
  static $pb.PbList<SignatureKesProduct> createRepeated() => $pb.PbList<SignatureKesProduct>();
  @$core.pragma('dart2js:noInline')
  static SignatureKesProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignatureKesProduct>(create);
  static SignatureKesProduct? _defaultInstance;

  @$pb.TagNumber(1)
  SignatureKesSum get superSignature => $_getN(0);
  @$pb.TagNumber(1)
  set superSignature(SignatureKesSum v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuperSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuperSignature() => clearField(1);
  @$pb.TagNumber(1)
  SignatureKesSum ensureSuperSignature() => $_ensure(0);

  @$pb.TagNumber(2)
  SignatureKesSum get subSignature => $_getN(1);
  @$pb.TagNumber(2)
  set subSignature(SignatureKesSum v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubSignature() => clearField(2);
  @$pb.TagNumber(2)
  SignatureKesSum ensureSubSignature() => $_ensure(1);

  /// length = 32
  @$pb.TagNumber(3)
  $core.List<$core.int> get subRoot => $_getN(2);
  @$pb.TagNumber(3)
  set subRoot($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubRoot() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubRoot() => clearField(3);
}

/// A glorified tuple
class SlotId extends $pb.GeneratedMessage {
  factory SlotId({
    $fixnum.Int64? slot,
    BlockId? blockId,
  }) {
    final $result = create();
    if (slot != null) {
      $result.slot = slot;
    }
    if (blockId != null) {
      $result.blockId = blockId;
    }
    return $result;
  }
  SlotId._() : super();
  factory SlotId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SlotId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SlotId', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'slot', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<BlockId>(2, _omitFieldNames ? '' : 'blockId', protoName: 'blockId', subBuilder: BlockId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SlotId clone() => SlotId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SlotId copyWith(void Function(SlotId) updates) => super.copyWith((message) => updates(message as SlotId)) as SlotId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SlotId create() => SlotId._();
  SlotId createEmptyInstance() => create();
  static $pb.PbList<SlotId> createRepeated() => $pb.PbList<SlotId>();
  @$core.pragma('dart2js:noInline')
  static SlotId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SlotId>(create);
  static SlotId? _defaultInstance;

  /// The slot in which a block was created
  @$pb.TagNumber(1)
  $fixnum.Int64 get slot => $_getI64(0);
  @$pb.TagNumber(1)
  set slot($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSlot() => $_has(0);
  @$pb.TagNumber(1)
  void clearSlot() => clearField(1);

  /// The ID of the block
  @$pb.TagNumber(2)
  BlockId get blockId => $_getN(1);
  @$pb.TagNumber(2)
  set blockId(BlockId v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockId() => clearField(2);
  @$pb.TagNumber(2)
  BlockId ensureBlockId() => $_ensure(1);
}

class StakingAddress extends $pb.GeneratedMessage {
  factory StakingAddress({
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  StakingAddress._() : super();
  factory StakingAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StakingAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StakingAddress', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StakingAddress clone() => StakingAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StakingAddress copyWith(void Function(StakingAddress) updates) => super.copyWith((message) => updates(message as StakingAddress)) as StakingAddress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StakingAddress create() => StakingAddress._();
  StakingAddress createEmptyInstance() => create();
  static $pb.PbList<StakingAddress> createRepeated() => $pb.PbList<StakingAddress>();
  @$core.pragma('dart2js:noInline')
  static StakingAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StakingAddress>(create);
  static StakingAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

/// Captures the ordering of transaction IDs within a block
class BlockBody extends $pb.GeneratedMessage {
  factory BlockBody({
    $core.Iterable<TransactionId>? transactionIds,
  }) {
    final $result = create();
    if (transactionIds != null) {
      $result.transactionIds.addAll(transactionIds);
    }
    return $result;
  }
  BlockBody._() : super();
  factory BlockBody.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockBody.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockBody', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..pc<TransactionId>(1, _omitFieldNames ? '' : 'transactionIds', $pb.PbFieldType.PM, protoName: 'transactionIds', subBuilder: TransactionId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockBody clone() => BlockBody()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockBody copyWith(void Function(BlockBody) updates) => super.copyWith((message) => updates(message as BlockBody)) as BlockBody;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockBody create() => BlockBody._();
  BlockBody createEmptyInstance() => create();
  static $pb.PbList<BlockBody> createRepeated() => $pb.PbList<BlockBody>();
  @$core.pragma('dart2js:noInline')
  static BlockBody getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockBody>(create);
  static BlockBody? _defaultInstance;

  /// A list of Transaction IDs included in this block
  @$pb.TagNumber(1)
  $core.List<TransactionId> get transactionIds => $_getList(0);
}

/// Captures the ordering of transactions (not just IDs) within a block
class FullBlockBody extends $pb.GeneratedMessage {
  factory FullBlockBody({
    $core.Iterable<Transaction>? transactions,
  }) {
    final $result = create();
    if (transactions != null) {
      $result.transactions.addAll(transactions);
    }
    return $result;
  }
  FullBlockBody._() : super();
  factory FullBlockBody.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FullBlockBody.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FullBlockBody', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..pc<Transaction>(1, _omitFieldNames ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FullBlockBody clone() => FullBlockBody()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FullBlockBody copyWith(void Function(FullBlockBody) updates) => super.copyWith((message) => updates(message as FullBlockBody)) as FullBlockBody;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FullBlockBody create() => FullBlockBody._();
  FullBlockBody createEmptyInstance() => create();
  static $pb.PbList<FullBlockBody> createRepeated() => $pb.PbList<FullBlockBody>();
  @$core.pragma('dart2js:noInline')
  static FullBlockBody getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FullBlockBody>(create);
  static FullBlockBody? _defaultInstance;

  /// A list of Transactions included in this block
  @$pb.TagNumber(1)
  $core.List<Transaction> get transactions => $_getList(0);
}

/// Captures the header and all transactions in a block
class Block extends $pb.GeneratedMessage {
  factory Block({
    BlockHeader? header,
    BlockBody? body,
  }) {
    final $result = create();
    if (header != null) {
      $result.header = header;
    }
    if (body != null) {
      $result.body = body;
    }
    return $result;
  }
  Block._() : super();
  factory Block.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Block.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Block', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<BlockHeader>(1, _omitFieldNames ? '' : 'header', subBuilder: BlockHeader.create)
    ..aOM<BlockBody>(2, _omitFieldNames ? '' : 'body', subBuilder: BlockBody.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Block clone() => Block()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Block copyWith(void Function(Block) updates) => super.copyWith((message) => updates(message as Block)) as Block;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Block create() => Block._();
  Block createEmptyInstance() => create();
  static $pb.PbList<Block> createRepeated() => $pb.PbList<Block>();
  @$core.pragma('dart2js:noInline')
  static Block getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Block>(create);
  static Block? _defaultInstance;

  /// The block's header
  @$pb.TagNumber(1)
  BlockHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(BlockHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  BlockHeader ensureHeader() => $_ensure(0);

  /// The block's body
  @$pb.TagNumber(2)
  BlockBody get body => $_getN(1);
  @$pb.TagNumber(2)
  set body(BlockBody v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => clearField(2);
  @$pb.TagNumber(2)
  BlockBody ensureBody() => $_ensure(1);
}

/// Captures the header and all transactions in a block
class FullBlock extends $pb.GeneratedMessage {
  factory FullBlock({
    BlockHeader? header,
    FullBlockBody? fullBody,
  }) {
    final $result = create();
    if (header != null) {
      $result.header = header;
    }
    if (fullBody != null) {
      $result.fullBody = fullBody;
    }
    return $result;
  }
  FullBlock._() : super();
  factory FullBlock.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FullBlock.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FullBlock', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<BlockHeader>(1, _omitFieldNames ? '' : 'header', subBuilder: BlockHeader.create)
    ..aOM<FullBlockBody>(2, _omitFieldNames ? '' : 'fullBody', protoName: 'fullBody', subBuilder: FullBlockBody.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FullBlock clone() => FullBlock()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FullBlock copyWith(void Function(FullBlock) updates) => super.copyWith((message) => updates(message as FullBlock)) as FullBlock;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FullBlock create() => FullBlock._();
  FullBlock createEmptyInstance() => create();
  static $pb.PbList<FullBlock> createRepeated() => $pb.PbList<FullBlock>();
  @$core.pragma('dart2js:noInline')
  static FullBlock getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FullBlock>(create);
  static FullBlock? _defaultInstance;

  /// The block's header
  @$pb.TagNumber(1)
  BlockHeader get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(BlockHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => clearField(1);
  @$pb.TagNumber(1)
  BlockHeader ensureHeader() => $_ensure(0);

  /// The block's full body
  @$pb.TagNumber(2)
  FullBlockBody get fullBody => $_getN(1);
  @$pb.TagNumber(2)
  set fullBody(FullBlockBody v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFullBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullBody() => clearField(2);
  @$pb.TagNumber(2)
  FullBlockBody ensureFullBody() => $_ensure(1);
}

/// Represents the identifier of a Transction.  It is constructed from the evidence of the signable bytes of the Transaction.
class TransactionId extends $pb.GeneratedMessage {
  factory TransactionId({
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  TransactionId._() : super();
  factory TransactionId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionId', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionId clone() => TransactionId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionId copyWith(void Function(TransactionId) updates) => super.copyWith((message) => updates(message as TransactionId)) as TransactionId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionId create() => TransactionId._();
  TransactionId createEmptyInstance() => create();
  static $pb.PbList<TransactionId> createRepeated() => $pb.PbList<TransactionId>();
  @$core.pragma('dart2js:noInline')
  static TransactionId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionId>(create);
  static TransactionId? _defaultInstance;

  /// The evidence of the Transaction's signable bytes
  /// length = 32
  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    TransactionId? transactionId,
    $core.Iterable<TransactionInput>? inputs,
    $core.Iterable<TransactionOutput>? outputs,
    $core.Iterable<Witness>? attestation,
    BlockId? rewardParentBlockId,
  }) {
    final $result = create();
    if (transactionId != null) {
      $result.transactionId = transactionId;
    }
    if (inputs != null) {
      $result.inputs.addAll(inputs);
    }
    if (outputs != null) {
      $result.outputs.addAll(outputs);
    }
    if (attestation != null) {
      $result.attestation.addAll(attestation);
    }
    if (rewardParentBlockId != null) {
      $result.rewardParentBlockId = rewardParentBlockId;
    }
    return $result;
  }
  Transaction._() : super();
  factory Transaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transaction', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<TransactionId>(1, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId', subBuilder: TransactionId.create)
    ..pc<TransactionInput>(2, _omitFieldNames ? '' : 'inputs', $pb.PbFieldType.PM, subBuilder: TransactionInput.create)
    ..pc<TransactionOutput>(3, _omitFieldNames ? '' : 'outputs', $pb.PbFieldType.PM, subBuilder: TransactionOutput.create)
    ..pc<Witness>(4, _omitFieldNames ? '' : 'attestation', $pb.PbFieldType.PM, subBuilder: Witness.create)
    ..aOM<BlockId>(5, _omitFieldNames ? '' : 'rewardParentBlockId', protoName: 'rewardParentBlockId', subBuilder: BlockId.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transaction clone() => Transaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transaction copyWith(void Function(Transaction) updates) => super.copyWith((message) => updates(message as Transaction)) as Transaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionId get transactionId => $_getN(0);
  @$pb.TagNumber(1)
  set transactionId(TransactionId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);
  @$pb.TagNumber(1)
  TransactionId ensureTransactionId() => $_ensure(0);

  /// If this is a reward transaction, this field should be empty
  @$pb.TagNumber(2)
  $core.List<TransactionInput> get inputs => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<TransactionOutput> get outputs => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Witness> get attestation => $_getList(3);

  /// User transactions should leave this empty.
  /// When not null, this Transaction is assumed to be a reward transaction, and the value of this field should be the parent block ID
  @$pb.TagNumber(5)
  BlockId get rewardParentBlockId => $_getN(4);
  @$pb.TagNumber(5)
  set rewardParentBlockId(BlockId v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRewardParentBlockId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRewardParentBlockId() => clearField(5);
  @$pb.TagNumber(5)
  BlockId ensureRewardParentBlockId() => $_ensure(4);
}

class Witness extends $pb.GeneratedMessage {
  factory Witness({
    Lock? lock,
    Key? key,
    LockAddress? lockAddress,
  }) {
    final $result = create();
    if (lock != null) {
      $result.lock = lock;
    }
    if (key != null) {
      $result.key = key;
    }
    if (lockAddress != null) {
      $result.lockAddress = lockAddress;
    }
    return $result;
  }
  Witness._() : super();
  factory Witness.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Witness.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Witness', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<Lock>(1, _omitFieldNames ? '' : 'lock', subBuilder: Lock.create)
    ..aOM<Key>(2, _omitFieldNames ? '' : 'key', subBuilder: Key.create)
    ..aOM<LockAddress>(3, _omitFieldNames ? '' : 'lockAddress', protoName: 'lockAddress', subBuilder: LockAddress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Witness clone() => Witness()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Witness copyWith(void Function(Witness) updates) => super.copyWith((message) => updates(message as Witness)) as Witness;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Witness create() => Witness._();
  Witness createEmptyInstance() => create();
  static $pb.PbList<Witness> createRepeated() => $pb.PbList<Witness>();
  @$core.pragma('dart2js:noInline')
  static Witness getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Witness>(create);
  static Witness? _defaultInstance;

  @$pb.TagNumber(1)
  Lock get lock => $_getN(0);
  @$pb.TagNumber(1)
  set lock(Lock v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock() => clearField(1);
  @$pb.TagNumber(1)
  Lock ensureLock() => $_ensure(0);

  @$pb.TagNumber(2)
  Key get key => $_getN(1);
  @$pb.TagNumber(2)
  set key(Key v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);
  @$pb.TagNumber(2)
  Key ensureKey() => $_ensure(1);

  @$pb.TagNumber(3)
  LockAddress get lockAddress => $_getN(2);
  @$pb.TagNumber(3)
  set lockAddress(LockAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLockAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearLockAddress() => clearField(3);
  @$pb.TagNumber(3)
  LockAddress ensureLockAddress() => $_ensure(2);
}

class TransactionInput extends $pb.GeneratedMessage {
  factory TransactionInput({
    TransactionOutputReference? reference,
    Value? value,
  }) {
    final $result = create();
    if (reference != null) {
      $result.reference = reference;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  TransactionInput._() : super();
  factory TransactionInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<TransactionOutputReference>(1, _omitFieldNames ? '' : 'reference', subBuilder: TransactionOutputReference.create)
    ..aOM<Value>(2, _omitFieldNames ? '' : 'value', subBuilder: Value.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionInput clone() => TransactionInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionInput copyWith(void Function(TransactionInput) updates) => super.copyWith((message) => updates(message as TransactionInput)) as TransactionInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInput create() => TransactionInput._();
  TransactionInput createEmptyInstance() => create();
  static $pb.PbList<TransactionInput> createRepeated() => $pb.PbList<TransactionInput>();
  @$core.pragma('dart2js:noInline')
  static TransactionInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInput>(create);
  static TransactionInput? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionOutputReference get reference => $_getN(0);
  @$pb.TagNumber(1)
  set reference(TransactionOutputReference v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasReference() => $_has(0);
  @$pb.TagNumber(1)
  void clearReference() => clearField(1);
  @$pb.TagNumber(1)
  TransactionOutputReference ensureReference() => $_ensure(0);

  @$pb.TagNumber(2)
  Value get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(Value v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  Value ensureValue() => $_ensure(1);
}

class TransactionOutputReference extends $pb.GeneratedMessage {
  factory TransactionOutputReference({
    TransactionId? transactionId,
    $core.int? index,
  }) {
    final $result = create();
    if (transactionId != null) {
      $result.transactionId = transactionId;
    }
    if (index != null) {
      $result.index = index;
    }
    return $result;
  }
  TransactionOutputReference._() : super();
  factory TransactionOutputReference.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionOutputReference.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionOutputReference', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<TransactionId>(1, _omitFieldNames ? '' : 'transactionId', protoName: 'transactionId', subBuilder: TransactionId.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionOutputReference clone() => TransactionOutputReference()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionOutputReference copyWith(void Function(TransactionOutputReference) updates) => super.copyWith((message) => updates(message as TransactionOutputReference)) as TransactionOutputReference;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionOutputReference create() => TransactionOutputReference._();
  TransactionOutputReference createEmptyInstance() => create();
  static $pb.PbList<TransactionOutputReference> createRepeated() => $pb.PbList<TransactionOutputReference>();
  @$core.pragma('dart2js:noInline')
  static TransactionOutputReference getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionOutputReference>(create);
  static TransactionOutputReference? _defaultInstance;

  @$pb.TagNumber(1)
  TransactionId get transactionId => $_getN(0);
  @$pb.TagNumber(1)
  set transactionId(TransactionId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);
  @$pb.TagNumber(1)
  TransactionId ensureTransactionId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);
}

class TransactionOutput extends $pb.GeneratedMessage {
  factory TransactionOutput({
    LockAddress? lockAddress,
    Value? value,
    TransactionOutputReference? account,
  }) {
    final $result = create();
    if (lockAddress != null) {
      $result.lockAddress = lockAddress;
    }
    if (value != null) {
      $result.value = value;
    }
    if (account != null) {
      $result.account = account;
    }
    return $result;
  }
  TransactionOutput._() : super();
  factory TransactionOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<LockAddress>(1, _omitFieldNames ? '' : 'lockAddress', protoName: 'lockAddress', subBuilder: LockAddress.create)
    ..aOM<Value>(2, _omitFieldNames ? '' : 'value', subBuilder: Value.create)
    ..aOM<TransactionOutputReference>(3, _omitFieldNames ? '' : 'account', subBuilder: TransactionOutputReference.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionOutput clone() => TransactionOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionOutput copyWith(void Function(TransactionOutput) updates) => super.copyWith((message) => updates(message as TransactionOutput)) as TransactionOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionOutput create() => TransactionOutput._();
  TransactionOutput createEmptyInstance() => create();
  static $pb.PbList<TransactionOutput> createRepeated() => $pb.PbList<TransactionOutput>();
  @$core.pragma('dart2js:noInline')
  static TransactionOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionOutput>(create);
  static TransactionOutput? _defaultInstance;

  @$pb.TagNumber(1)
  LockAddress get lockAddress => $_getN(0);
  @$pb.TagNumber(1)
  set lockAddress(LockAddress v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLockAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearLockAddress() => clearField(1);
  @$pb.TagNumber(1)
  LockAddress ensureLockAddress() => $_ensure(0);

  @$pb.TagNumber(2)
  Value get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(Value v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  Value ensureValue() => $_ensure(1);

  /// Optional
  @$pb.TagNumber(3)
  TransactionOutputReference get account => $_getN(2);
  @$pb.TagNumber(3)
  set account(TransactionOutputReference v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccount() => clearField(3);
  @$pb.TagNumber(3)
  TransactionOutputReference ensureAccount() => $_ensure(2);
}

class Value extends $pb.GeneratedMessage {
  factory Value({
    $fixnum.Int64? quantity,
    AccountRegistration? accountRegistration,
    GraphEntry? graphEntry,
  }) {
    final $result = create();
    if (quantity != null) {
      $result.quantity = quantity;
    }
    if (accountRegistration != null) {
      $result.accountRegistration = accountRegistration;
    }
    if (graphEntry != null) {
      $result.graphEntry = graphEntry;
    }
    return $result;
  }
  Value._() : super();
  factory Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Value', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<AccountRegistration>(2, _omitFieldNames ? '' : 'accountRegistration', protoName: 'accountRegistration', subBuilder: AccountRegistration.create)
    ..aOM<GraphEntry>(3, _omitFieldNames ? '' : 'graphEntry', protoName: 'graphEntry', subBuilder: GraphEntry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Value clone() => Value()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Value copyWith(void Function(Value) updates) => super.copyWith((message) => updates(message as Value)) as Value;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Value create() => Value._();
  Value createEmptyInstance() => create();
  static $pb.PbList<Value> createRepeated() => $pb.PbList<Value>();
  @$core.pragma('dart2js:noInline')
  static Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Value>(create);
  static Value? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get quantity => $_getI64(0);
  @$pb.TagNumber(1)
  set quantity($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuantity() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuantity() => clearField(1);

  @$pb.TagNumber(2)
  AccountRegistration get accountRegistration => $_getN(1);
  @$pb.TagNumber(2)
  set accountRegistration(AccountRegistration v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountRegistration() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountRegistration() => clearField(2);
  @$pb.TagNumber(2)
  AccountRegistration ensureAccountRegistration() => $_ensure(1);

  /// Optional
  @$pb.TagNumber(3)
  GraphEntry get graphEntry => $_getN(2);
  @$pb.TagNumber(3)
  set graphEntry(GraphEntry v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGraphEntry() => $_has(2);
  @$pb.TagNumber(3)
  void clearGraphEntry() => clearField(3);
  @$pb.TagNumber(3)
  GraphEntry ensureGraphEntry() => $_ensure(2);
}

class AccountRegistration extends $pb.GeneratedMessage {
  factory AccountRegistration({
    LockAddress? associationLock,
    StakingRegistration? stakingRegistration,
  }) {
    final $result = create();
    if (associationLock != null) {
      $result.associationLock = associationLock;
    }
    if (stakingRegistration != null) {
      $result.stakingRegistration = stakingRegistration;
    }
    return $result;
  }
  AccountRegistration._() : super();
  factory AccountRegistration.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountRegistration.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountRegistration', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<LockAddress>(1, _omitFieldNames ? '' : 'associationLock', protoName: 'associationLock', subBuilder: LockAddress.create)
    ..aOM<StakingRegistration>(2, _omitFieldNames ? '' : 'stakingRegistration', protoName: 'stakingRegistration', subBuilder: StakingRegistration.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountRegistration clone() => AccountRegistration()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountRegistration copyWith(void Function(AccountRegistration) updates) => super.copyWith((message) => updates(message as AccountRegistration)) as AccountRegistration;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountRegistration create() => AccountRegistration._();
  AccountRegistration createEmptyInstance() => create();
  static $pb.PbList<AccountRegistration> createRepeated() => $pb.PbList<AccountRegistration>();
  @$core.pragma('dart2js:noInline')
  static AccountRegistration getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountRegistration>(create);
  static AccountRegistration? _defaultInstance;

  @$pb.TagNumber(1)
  LockAddress get associationLock => $_getN(0);
  @$pb.TagNumber(1)
  set associationLock(LockAddress v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAssociationLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssociationLock() => clearField(1);
  @$pb.TagNumber(1)
  LockAddress ensureAssociationLock() => $_ensure(0);

  /// Optional.  If provided, introduces a new staker to the chain.
  @$pb.TagNumber(2)
  StakingRegistration get stakingRegistration => $_getN(1);
  @$pb.TagNumber(2)
  set stakingRegistration(StakingRegistration v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStakingRegistration() => $_has(1);
  @$pb.TagNumber(2)
  void clearStakingRegistration() => clearField(2);
  @$pb.TagNumber(2)
  StakingRegistration ensureStakingRegistration() => $_ensure(1);
}

/// A proof-of-stake registration
class StakingRegistration extends $pb.GeneratedMessage {
  factory StakingRegistration({
    SignatureKesProduct? signature,
    StakingAddress? stakingAddress,
  }) {
    final $result = create();
    if (signature != null) {
      $result.signature = signature;
    }
    if (stakingAddress != null) {
      $result.stakingAddress = stakingAddress;
    }
    return $result;
  }
  StakingRegistration._() : super();
  factory StakingRegistration.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StakingRegistration.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StakingRegistration', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<SignatureKesProduct>(1, _omitFieldNames ? '' : 'signature', subBuilder: SignatureKesProduct.create)
    ..aOM<StakingAddress>(2, _omitFieldNames ? '' : 'stakingAddress', protoName: 'stakingAddress', subBuilder: StakingAddress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StakingRegistration clone() => StakingRegistration()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StakingRegistration copyWith(void Function(StakingRegistration) updates) => super.copyWith((message) => updates(message as StakingRegistration)) as StakingRegistration;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StakingRegistration create() => StakingRegistration._();
  StakingRegistration createEmptyInstance() => create();
  static $pb.PbList<StakingRegistration> createRepeated() => $pb.PbList<StakingRegistration>();
  @$core.pragma('dart2js:noInline')
  static StakingRegistration getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StakingRegistration>(create);
  static StakingRegistration? _defaultInstance;

  @$pb.TagNumber(1)
  SignatureKesProduct get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature(SignatureKesProduct v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);
  @$pb.TagNumber(1)
  SignatureKesProduct ensureSignature() => $_ensure(0);

  @$pb.TagNumber(2)
  StakingAddress get stakingAddress => $_getN(1);
  @$pb.TagNumber(2)
  set stakingAddress(StakingAddress v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStakingAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearStakingAddress() => clearField(2);
  @$pb.TagNumber(2)
  StakingAddress ensureStakingAddress() => $_ensure(1);
}

enum GraphEntry_Entry {
  vertex, 
  edge, 
  notSet
}

class GraphEntry extends $pb.GeneratedMessage {
  factory GraphEntry({
    Vertex? vertex,
    Edge? edge,
  }) {
    final $result = create();
    if (vertex != null) {
      $result.vertex = vertex;
    }
    if (edge != null) {
      $result.edge = edge;
    }
    return $result;
  }
  GraphEntry._() : super();
  factory GraphEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GraphEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, GraphEntry_Entry> _GraphEntry_EntryByTag = {
    1 : GraphEntry_Entry.vertex,
    2 : GraphEntry_Entry.edge,
    0 : GraphEntry_Entry.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GraphEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Vertex>(1, _omitFieldNames ? '' : 'vertex', subBuilder: Vertex.create)
    ..aOM<Edge>(2, _omitFieldNames ? '' : 'edge', subBuilder: Edge.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GraphEntry clone() => GraphEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GraphEntry copyWith(void Function(GraphEntry) updates) => super.copyWith((message) => updates(message as GraphEntry)) as GraphEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GraphEntry create() => GraphEntry._();
  GraphEntry createEmptyInstance() => create();
  static $pb.PbList<GraphEntry> createRepeated() => $pb.PbList<GraphEntry>();
  @$core.pragma('dart2js:noInline')
  static GraphEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GraphEntry>(create);
  static GraphEntry? _defaultInstance;

  GraphEntry_Entry whichEntry() => _GraphEntry_EntryByTag[$_whichOneof(0)]!;
  void clearEntry() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Vertex get vertex => $_getN(0);
  @$pb.TagNumber(1)
  set vertex(Vertex v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVertex() => $_has(0);
  @$pb.TagNumber(1)
  void clearVertex() => clearField(1);
  @$pb.TagNumber(1)
  Vertex ensureVertex() => $_ensure(0);

  @$pb.TagNumber(2)
  Edge get edge => $_getN(1);
  @$pb.TagNumber(2)
  set edge(Edge v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEdge() => $_has(1);
  @$pb.TagNumber(2)
  void clearEdge() => clearField(2);
  @$pb.TagNumber(2)
  Edge ensureEdge() => $_ensure(1);
}

class Vertex extends $pb.GeneratedMessage {
  factory Vertex({
    $core.String? label,
    $3.Struct? data,
    LockAddress? edgeLockAddress,
  }) {
    final $result = create();
    if (label != null) {
      $result.label = label;
    }
    if (data != null) {
      $result.data = data;
    }
    if (edgeLockAddress != null) {
      $result.edgeLockAddress = edgeLockAddress;
    }
    return $result;
  }
  Vertex._() : super();
  factory Vertex.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Vertex.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Vertex', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..aOM<$3.Struct>(2, _omitFieldNames ? '' : 'data', subBuilder: $3.Struct.create)
    ..aOM<LockAddress>(3, _omitFieldNames ? '' : 'edgeLockAddress', protoName: 'edgeLockAddress', subBuilder: LockAddress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Vertex clone() => Vertex()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Vertex copyWith(void Function(Vertex) updates) => super.copyWith((message) => updates(message as Vertex)) as Vertex;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Vertex create() => Vertex._();
  Vertex createEmptyInstance() => create();
  static $pb.PbList<Vertex> createRepeated() => $pb.PbList<Vertex>();
  @$core.pragma('dart2js:noInline')
  static Vertex getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vertex>(create);
  static Vertex? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $3.Struct get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($3.Struct v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  $3.Struct ensureData() => $_ensure(1);

  @$pb.TagNumber(3)
  LockAddress get edgeLockAddress => $_getN(2);
  @$pb.TagNumber(3)
  set edgeLockAddress(LockAddress v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEdgeLockAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearEdgeLockAddress() => clearField(3);
  @$pb.TagNumber(3)
  LockAddress ensureEdgeLockAddress() => $_ensure(2);
}

class Edge extends $pb.GeneratedMessage {
  factory Edge({
    $core.String? label,
    $3.Struct? data,
    TransactionOutputReference? a,
    TransactionOutputReference? b,
  }) {
    final $result = create();
    if (label != null) {
      $result.label = label;
    }
    if (data != null) {
      $result.data = data;
    }
    if (a != null) {
      $result.a = a;
    }
    if (b != null) {
      $result.b = b;
    }
    return $result;
  }
  Edge._() : super();
  factory Edge.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Edge.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Edge', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..aOM<$3.Struct>(2, _omitFieldNames ? '' : 'data', subBuilder: $3.Struct.create)
    ..aOM<TransactionOutputReference>(3, _omitFieldNames ? '' : 'a', subBuilder: TransactionOutputReference.create)
    ..aOM<TransactionOutputReference>(4, _omitFieldNames ? '' : 'b', subBuilder: TransactionOutputReference.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Edge clone() => Edge()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Edge copyWith(void Function(Edge) updates) => super.copyWith((message) => updates(message as Edge)) as Edge;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Edge create() => Edge._();
  Edge createEmptyInstance() => create();
  static $pb.PbList<Edge> createRepeated() => $pb.PbList<Edge>();
  @$core.pragma('dart2js:noInline')
  static Edge getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Edge>(create);
  static Edge? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $3.Struct get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($3.Struct v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  $3.Struct ensureData() => $_ensure(1);

  @$pb.TagNumber(3)
  TransactionOutputReference get a => $_getN(2);
  @$pb.TagNumber(3)
  set a(TransactionOutputReference v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasA() => $_has(2);
  @$pb.TagNumber(3)
  void clearA() => clearField(3);
  @$pb.TagNumber(3)
  TransactionOutputReference ensureA() => $_ensure(2);

  @$pb.TagNumber(4)
  TransactionOutputReference get b => $_getN(3);
  @$pb.TagNumber(4)
  set b(TransactionOutputReference v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasB() => $_has(3);
  @$pb.TagNumber(4)
  void clearB() => clearField(4);
  @$pb.TagNumber(4)
  TransactionOutputReference ensureB() => $_ensure(3);
}

/// An active, registered participate in the consensus protocol, for a particular epoch.
class ActiveStaker extends $pb.GeneratedMessage {
  factory ActiveStaker({
    StakingRegistration? registration,
    $fixnum.Int64? quantity,
  }) {
    final $result = create();
    if (registration != null) {
      $result.registration = registration;
    }
    if (quantity != null) {
      $result.quantity = quantity;
    }
    return $result;
  }
  ActiveStaker._() : super();
  factory ActiveStaker.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveStaker.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveStaker', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<StakingRegistration>(1, _omitFieldNames ? '' : 'registration', subBuilder: StakingRegistration.create)
    ..aInt64(2, _omitFieldNames ? '' : 'quantity')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveStaker clone() => ActiveStaker()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveStaker copyWith(void Function(ActiveStaker) updates) => super.copyWith((message) => updates(message as ActiveStaker)) as ActiveStaker;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveStaker create() => ActiveStaker._();
  ActiveStaker createEmptyInstance() => create();
  static $pb.PbList<ActiveStaker> createRepeated() => $pb.PbList<ActiveStaker>();
  @$core.pragma('dart2js:noInline')
  static ActiveStaker getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveStaker>(create);
  static ActiveStaker? _defaultInstance;

  /// The staker's registration.  If not provided, the StakingAddress is not associated with a StakingRegistration
  @$pb.TagNumber(1)
  StakingRegistration get registration => $_getN(0);
  @$pb.TagNumber(1)
  set registration(StakingRegistration v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegistration() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegistration() => clearField(1);
  @$pb.TagNumber(1)
  StakingRegistration ensureRegistration() => $_ensure(0);

  /// the quantity of staked tokens for the epoch
  @$pb.TagNumber(2)
  $fixnum.Int64 get quantity => $_getI64(1);
  @$pb.TagNumber(2)
  set quantity($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => clearField(2);
}

class LockAddress extends $pb.GeneratedMessage {
  factory LockAddress({
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  LockAddress._() : super();
  factory LockAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LockAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LockAddress', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LockAddress clone() => LockAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LockAddress copyWith(void Function(LockAddress) updates) => super.copyWith((message) => updates(message as LockAddress)) as LockAddress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LockAddress create() => LockAddress._();
  LockAddress createEmptyInstance() => create();
  static $pb.PbList<LockAddress> createRepeated() => $pb.PbList<LockAddress>();
  @$core.pragma('dart2js:noInline')
  static LockAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LockAddress>(create);
  static LockAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class Lock_Ed25519 extends $pb.GeneratedMessage {
  factory Lock_Ed25519({
    $core.List<$core.int>? vk,
  }) {
    final $result = create();
    if (vk != null) {
      $result.vk = vk;
    }
    return $result;
  }
  Lock_Ed25519._() : super();
  factory Lock_Ed25519.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lock_Ed25519.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Lock.Ed25519', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'vk', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lock_Ed25519 clone() => Lock_Ed25519()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lock_Ed25519 copyWith(void Function(Lock_Ed25519) updates) => super.copyWith((message) => updates(message as Lock_Ed25519)) as Lock_Ed25519;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Lock_Ed25519 create() => Lock_Ed25519._();
  Lock_Ed25519 createEmptyInstance() => create();
  static $pb.PbList<Lock_Ed25519> createRepeated() => $pb.PbList<Lock_Ed25519>();
  @$core.pragma('dart2js:noInline')
  static Lock_Ed25519 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lock_Ed25519>(create);
  static Lock_Ed25519? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get vk => $_getN(0);
  @$pb.TagNumber(1)
  set vk($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVk() => $_has(0);
  @$pb.TagNumber(1)
  void clearVk() => clearField(1);
}

enum Lock_Value {
  ed25519, 
  notSet
}

class Lock extends $pb.GeneratedMessage {
  factory Lock({
    Lock_Ed25519? ed25519,
  }) {
    final $result = create();
    if (ed25519 != null) {
      $result.ed25519 = ed25519;
    }
    return $result;
  }
  Lock._() : super();
  factory Lock.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lock.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Lock_Value> _Lock_ValueByTag = {
    1 : Lock_Value.ed25519,
    0 : Lock_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Lock', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<Lock_Ed25519>(1, _omitFieldNames ? '' : 'ed25519', subBuilder: Lock_Ed25519.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lock clone() => Lock()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lock copyWith(void Function(Lock) updates) => super.copyWith((message) => updates(message as Lock)) as Lock;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Lock create() => Lock._();
  Lock createEmptyInstance() => create();
  static $pb.PbList<Lock> createRepeated() => $pb.PbList<Lock>();
  @$core.pragma('dart2js:noInline')
  static Lock getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lock>(create);
  static Lock? _defaultInstance;

  Lock_Value whichValue() => _Lock_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Lock_Ed25519 get ed25519 => $_getN(0);
  @$pb.TagNumber(1)
  set ed25519(Lock_Ed25519 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEd25519() => $_has(0);
  @$pb.TagNumber(1)
  void clearEd25519() => clearField(1);
  @$pb.TagNumber(1)
  Lock_Ed25519 ensureEd25519() => $_ensure(0);
}

class Key_Ed25519 extends $pb.GeneratedMessage {
  factory Key_Ed25519({
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  Key_Ed25519._() : super();
  factory Key_Ed25519.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Key_Ed25519.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Key.Ed25519', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Key_Ed25519 clone() => Key_Ed25519()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Key_Ed25519 copyWith(void Function(Key_Ed25519) updates) => super.copyWith((message) => updates(message as Key_Ed25519)) as Key_Ed25519;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Key_Ed25519 create() => Key_Ed25519._();
  Key_Ed25519 createEmptyInstance() => create();
  static $pb.PbList<Key_Ed25519> createRepeated() => $pb.PbList<Key_Ed25519>();
  @$core.pragma('dart2js:noInline')
  static Key_Ed25519 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Key_Ed25519>(create);
  static Key_Ed25519? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get signature => $_getN(0);
  @$pb.TagNumber(1)
  set signature($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignature() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignature() => clearField(1);
}

enum Key_Value {
  ed25519, 
  notSet
}

class Key extends $pb.GeneratedMessage {
  factory Key({
    Key_Ed25519? ed25519,
  }) {
    final $result = create();
    if (ed25519 != null) {
      $result.ed25519 = ed25519;
    }
    return $result;
  }
  Key._() : super();
  factory Key.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Key.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Key_Value> _Key_ValueByTag = {
    1 : Key_Value.ed25519,
    0 : Key_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Key', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<Key_Ed25519>(1, _omitFieldNames ? '' : 'ed25519', subBuilder: Key_Ed25519.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Key clone() => Key()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Key copyWith(void Function(Key) updates) => super.copyWith((message) => updates(message as Key)) as Key;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Key create() => Key._();
  Key createEmptyInstance() => create();
  static $pb.PbList<Key> createRepeated() => $pb.PbList<Key>();
  @$core.pragma('dart2js:noInline')
  static Key getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Key>(create);
  static Key? _defaultInstance;

  Key_Value whichValue() => _Key_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Key_Ed25519 get ed25519 => $_getN(0);
  @$pb.TagNumber(1)
  set ed25519(Key_Ed25519 v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEd25519() => $_has(0);
  @$pb.TagNumber(1)
  void clearEd25519() => clearField(1);
  @$pb.TagNumber(1)
  Key_Ed25519 ensureEd25519() => $_ensure(0);
}

class PeerId extends $pb.GeneratedMessage {
  factory PeerId({
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  PeerId._() : super();
  factory PeerId.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PeerId.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PeerId', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PeerId clone() => PeerId()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PeerId copyWith(void Function(PeerId) updates) => super.copyWith((message) => updates(message as PeerId)) as PeerId;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PeerId create() => PeerId._();
  PeerId createEmptyInstance() => create();
  static $pb.PbList<PeerId> createRepeated() => $pb.PbList<PeerId>();
  @$core.pragma('dart2js:noInline')
  static PeerId getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PeerId>(create);
  static PeerId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class PublicP2PState extends $pb.GeneratedMessage {
  factory PublicP2PState({
    ConnectedPeer? localPeer,
    $core.Iterable<ConnectedPeer>? peers,
  }) {
    final $result = create();
    if (localPeer != null) {
      $result.localPeer = localPeer;
    }
    if (peers != null) {
      $result.peers.addAll(peers);
    }
    return $result;
  }
  PublicP2PState._() : super();
  factory PublicP2PState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublicP2PState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublicP2PState', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<ConnectedPeer>(1, _omitFieldNames ? '' : 'localPeer', protoName: 'localPeer', subBuilder: ConnectedPeer.create)
    ..pc<ConnectedPeer>(2, _omitFieldNames ? '' : 'peers', $pb.PbFieldType.PM, subBuilder: ConnectedPeer.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublicP2PState clone() => PublicP2PState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublicP2PState copyWith(void Function(PublicP2PState) updates) => super.copyWith((message) => updates(message as PublicP2PState)) as PublicP2PState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicP2PState create() => PublicP2PState._();
  PublicP2PState createEmptyInstance() => create();
  static $pb.PbList<PublicP2PState> createRepeated() => $pb.PbList<PublicP2PState>();
  @$core.pragma('dart2js:noInline')
  static PublicP2PState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicP2PState>(create);
  static PublicP2PState? _defaultInstance;

  @$pb.TagNumber(1)
  ConnectedPeer get localPeer => $_getN(0);
  @$pb.TagNumber(1)
  set localPeer(ConnectedPeer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalPeer() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalPeer() => clearField(1);
  @$pb.TagNumber(1)
  ConnectedPeer ensureLocalPeer() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<ConnectedPeer> get peers => $_getList(1);
}

class ConnectedPeer extends $pb.GeneratedMessage {
  factory ConnectedPeer({
    PeerId? peerId,
    $4.StringValue? host,
    $4.UInt32Value? port,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  ConnectedPeer._() : super();
  factory ConnectedPeer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectedPeer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectedPeer', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.models'), createEmptyInstance: create)
    ..aOM<PeerId>(1, _omitFieldNames ? '' : 'peerId', protoName: 'peerId', subBuilder: PeerId.create)
    ..aOM<$4.StringValue>(2, _omitFieldNames ? '' : 'host', subBuilder: $4.StringValue.create)
    ..aOM<$4.UInt32Value>(3, _omitFieldNames ? '' : 'port', subBuilder: $4.UInt32Value.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectedPeer clone() => ConnectedPeer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectedPeer copyWith(void Function(ConnectedPeer) updates) => super.copyWith((message) => updates(message as ConnectedPeer)) as ConnectedPeer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectedPeer create() => ConnectedPeer._();
  ConnectedPeer createEmptyInstance() => create();
  static $pb.PbList<ConnectedPeer> createRepeated() => $pb.PbList<ConnectedPeer>();
  @$core.pragma('dart2js:noInline')
  static ConnectedPeer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectedPeer>(create);
  static ConnectedPeer? _defaultInstance;

  @$pb.TagNumber(1)
  PeerId get peerId => $_getN(0);
  @$pb.TagNumber(1)
  set peerId(PeerId v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
  @$pb.TagNumber(1)
  PeerId ensurePeerId() => $_ensure(0);

  @$pb.TagNumber(2)
  $4.StringValue get host => $_getN(1);
  @$pb.TagNumber(2)
  set host($4.StringValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearHost() => clearField(2);
  @$pb.TagNumber(2)
  $4.StringValue ensureHost() => $_ensure(1);

  @$pb.TagNumber(3)
  $4.UInt32Value get port => $_getN(2);
  @$pb.TagNumber(3)
  set port($4.UInt32Value v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearPort() => clearField(3);
  @$pb.TagNumber(3)
  $4.UInt32Value ensurePort() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
