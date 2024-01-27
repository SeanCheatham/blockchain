//
//  Generated code. Do not modify.
//  source: services/reducer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/struct.pb.dart' as $3;
import '../models/core.pb.dart' as $5;

class CreateReducerReq extends $pb.GeneratedMessage {
  factory CreateReducerReq({
    $core.String? language,
    $core.String? code,
    $3.Struct? input,
  }) {
    final $result = create();
    if (language != null) {
      $result.language = language;
    }
    if (code != null) {
      $result.code = code;
    }
    if (input != null) {
      $result.input = input;
    }
    return $result;
  }
  CreateReducerReq._() : super();
  factory CreateReducerReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateReducerReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateReducerReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'language')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOM<$3.Struct>(3, _omitFieldNames ? '' : 'input', subBuilder: $3.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateReducerReq clone() => CreateReducerReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateReducerReq copyWith(void Function(CreateReducerReq) updates) => super.copyWith((message) => updates(message as CreateReducerReq)) as CreateReducerReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateReducerReq create() => CreateReducerReq._();
  CreateReducerReq createEmptyInstance() => create();
  static $pb.PbList<CreateReducerReq> createRepeated() => $pb.PbList<CreateReducerReq>();
  @$core.pragma('dart2js:noInline')
  static CreateReducerReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateReducerReq>(create);
  static CreateReducerReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get language => $_getSZ(0);
  @$pb.TagNumber(1)
  set language($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $3.Struct get input => $_getN(2);
  @$pb.TagNumber(3)
  set input($3.Struct v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasInput() => $_has(2);
  @$pb.TagNumber(3)
  void clearInput() => clearField(3);
  @$pb.TagNumber(3)
  $3.Struct ensureInput() => $_ensure(2);
}

class CreateReducerRes extends $pb.GeneratedMessage {
  factory CreateReducerRes({
    $core.List<$core.int>? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  CreateReducerRes._() : super();
  factory CreateReducerRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateReducerRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateReducerRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateReducerRes clone() => CreateReducerRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateReducerRes copyWith(void Function(CreateReducerRes) updates) => super.copyWith((message) => updates(message as CreateReducerRes)) as CreateReducerRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateReducerRes create() => CreateReducerRes._();
  CreateReducerRes createEmptyInstance() => create();
  static $pb.PbList<CreateReducerRes> createRepeated() => $pb.PbList<CreateReducerRes>();
  @$core.pragma('dart2js:noInline')
  static CreateReducerRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateReducerRes>(create);
  static CreateReducerRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ReducerStateReq extends $pb.GeneratedMessage {
  factory ReducerStateReq({
    $core.List<$core.int>? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  ReducerStateReq._() : super();
  factory ReducerStateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReducerStateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReducerStateReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReducerStateReq clone() => ReducerStateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReducerStateReq copyWith(void Function(ReducerStateReq) updates) => super.copyWith((message) => updates(message as ReducerStateReq)) as ReducerStateReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReducerStateReq create() => ReducerStateReq._();
  ReducerStateReq createEmptyInstance() => create();
  static $pb.PbList<ReducerStateReq> createRepeated() => $pb.PbList<ReducerStateReq>();
  @$core.pragma('dart2js:noInline')
  static ReducerStateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReducerStateReq>(create);
  static ReducerStateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ReducerStateRes extends $pb.GeneratedMessage {
  factory ReducerStateRes({
    $core.List<$core.int>? id,
    $5.BlockId? blockId,
    $3.Struct? output,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (blockId != null) {
      $result.blockId = blockId;
    }
    if (output != null) {
      $result.output = output;
    }
    return $result;
  }
  ReducerStateRes._() : super();
  factory ReducerStateRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReducerStateRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReducerStateRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'blockchain.services'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..aOM<$5.BlockId>(2, _omitFieldNames ? '' : 'blockId', protoName: 'blockId', subBuilder: $5.BlockId.create)
    ..aOM<$3.Struct>(3, _omitFieldNames ? '' : 'output', subBuilder: $3.Struct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReducerStateRes clone() => ReducerStateRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReducerStateRes copyWith(void Function(ReducerStateRes) updates) => super.copyWith((message) => updates(message as ReducerStateRes)) as ReducerStateRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReducerStateRes create() => ReducerStateRes._();
  ReducerStateRes createEmptyInstance() => create();
  static $pb.PbList<ReducerStateRes> createRepeated() => $pb.PbList<ReducerStateRes>();
  @$core.pragma('dart2js:noInline')
  static ReducerStateRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReducerStateRes>(create);
  static ReducerStateRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $5.BlockId get blockId => $_getN(1);
  @$pb.TagNumber(2)
  set blockId($5.BlockId v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockId() => clearField(2);
  @$pb.TagNumber(2)
  $5.BlockId ensureBlockId() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.Struct get output => $_getN(2);
  @$pb.TagNumber(3)
  set output($3.Struct v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOutput() => $_has(2);
  @$pb.TagNumber(3)
  void clearOutput() => clearField(3);
  @$pb.TagNumber(3)
  $3.Struct ensureOutput() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
