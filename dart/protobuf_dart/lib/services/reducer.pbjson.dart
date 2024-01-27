//
//  Generated code. Do not modify.
//  source: services/reducer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createReducerReqDescriptor instead')
const CreateReducerReq$json = {
  '1': 'CreateReducerReq',
  '2': [
    {'1': 'language', '3': 1, '4': 1, '5': 9, '10': 'language'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'input', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '8': {}, '10': 'input'},
  ],
};

/// Descriptor for `CreateReducerReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReducerReqDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVSZWR1Y2VyUmVxEhoKCGxhbmd1YWdlGAEgASgJUghsYW5ndWFnZRISCgRjb2RlGA'
    'IgASgJUgRjb2RlEjcKBWlucHV0GAMgASgLMhcuZ29vZ2xlLnByb3RvYnVmLlN0cnVjdEII+kIF'
    'igECEAFSBWlucHV0');

@$core.Deprecated('Use createReducerResDescriptor instead')
const CreateReducerRes$json = {
  '1': 'CreateReducerRes',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

/// Descriptor for `CreateReducerRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReducerResDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVSZWR1Y2VyUmVzEg4KAmlkGAEgASgMUgJpZA==');

@$core.Deprecated('Use reducerStateReqDescriptor instead')
const ReducerStateReq$json = {
  '1': 'ReducerStateReq',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

/// Descriptor for `ReducerStateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reducerStateReqDescriptor = $convert.base64Decode(
    'Cg9SZWR1Y2VyU3RhdGVSZXESDgoCaWQYASABKAxSAmlk');

@$core.Deprecated('Use reducerStateResDescriptor instead')
const ReducerStateRes$json = {
  '1': 'ReducerStateRes',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'blockId', '3': 2, '4': 1, '5': 11, '6': '.blockchain.models.BlockId', '8': {}, '10': 'blockId'},
    {'1': 'output', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Struct', '8': {}, '10': 'output'},
  ],
};

/// Descriptor for `ReducerStateRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reducerStateResDescriptor = $convert.base64Decode(
    'Cg9SZWR1Y2VyU3RhdGVSZXMSDgoCaWQYASABKAxSAmlkEj4KB2Jsb2NrSWQYAiABKAsyGi5ibG'
    '9ja2NoYWluLm1vZGVscy5CbG9ja0lkQgj6QgWKAQIQAVIHYmxvY2tJZBI5CgZvdXRwdXQYAyAB'
    'KAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0Qgj6QgWKAQIQAVIGb3V0cHV0');

