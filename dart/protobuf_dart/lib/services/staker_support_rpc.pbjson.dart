//
//  Generated code. Do not modify.
//  source: services/staker_support_rpc.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use broadcastBlockReqDescriptor instead')
const BroadcastBlockReq$json = {
  '1': 'BroadcastBlockReq',
  '2': [
    {'1': 'block', '3': 1, '4': 1, '5': 11, '6': '.blockchain.models.Block', '8': {}, '10': 'block'},
    {'1': 'rewardTransaction', '3': 2, '4': 1, '5': 11, '6': '.blockchain.models.Transaction', '10': 'rewardTransaction'},
  ],
};

/// Descriptor for `BroadcastBlockReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastBlockReqDescriptor = $convert.base64Decode(
    'ChFCcm9hZGNhc3RCbG9ja1JlcRI4CgVibG9jaxgBIAEoCzIYLmJsb2NrY2hhaW4ubW9kZWxzLk'
    'Jsb2NrQgj6QgWKAQIQAVIFYmxvY2sSTAoRcmV3YXJkVHJhbnNhY3Rpb24YAiABKAsyHi5ibG9j'
    'a2NoYWluLm1vZGVscy5UcmFuc2FjdGlvblIRcmV3YXJkVHJhbnNhY3Rpb24=');

@$core.Deprecated('Use broadcastBlockResDescriptor instead')
const BroadcastBlockRes$json = {
  '1': 'BroadcastBlockRes',
};

/// Descriptor for `BroadcastBlockRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastBlockResDescriptor = $convert.base64Decode(
    'ChFCcm9hZGNhc3RCbG9ja1Jlcw==');

@$core.Deprecated('Use getStakerReqDescriptor instead')
const GetStakerReq$json = {
  '1': 'GetStakerReq',
  '2': [
    {'1': 'stakingAccount', '3': 1, '4': 1, '5': 11, '6': '.blockchain.models.TransactionOutputReference', '8': {}, '10': 'stakingAccount'},
    {'1': 'parentBlockId', '3': 2, '4': 1, '5': 11, '6': '.blockchain.models.BlockId', '8': {}, '10': 'parentBlockId'},
    {'1': 'slot', '3': 3, '4': 1, '5': 4, '10': 'slot'},
  ],
};

/// Descriptor for `GetStakerReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStakerReqDescriptor = $convert.base64Decode(
    'CgxHZXRTdGFrZXJSZXESXwoOc3Rha2luZ0FjY291bnQYASABKAsyLS5ibG9ja2NoYWluLm1vZG'
    'Vscy5UcmFuc2FjdGlvbk91dHB1dFJlZmVyZW5jZUII+kIFigECEAFSDnN0YWtpbmdBY2NvdW50'
    'EkoKDXBhcmVudEJsb2NrSWQYAiABKAsyGi5ibG9ja2NoYWluLm1vZGVscy5CbG9ja0lkQgj6Qg'
    'WKAQIQAVINcGFyZW50QmxvY2tJZBISCgRzbG90GAMgASgEUgRzbG90');

@$core.Deprecated('Use getStakerResDescriptor instead')
const GetStakerRes$json = {
  '1': 'GetStakerRes',
  '2': [
    {'1': 'staker', '3': 1, '4': 1, '5': 11, '6': '.blockchain.models.ActiveStaker', '10': 'staker'},
  ],
};

/// Descriptor for `GetStakerRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStakerResDescriptor = $convert.base64Decode(
    'CgxHZXRTdGFrZXJSZXMSNwoGc3Rha2VyGAEgASgLMh8uYmxvY2tjaGFpbi5tb2RlbHMuQWN0aX'
    'ZlU3Rha2VyUgZzdGFrZXI=');

@$core.Deprecated('Use getTotalActiveStakeReqDescriptor instead')
const GetTotalActiveStakeReq$json = {
  '1': 'GetTotalActiveStakeReq',
  '2': [
    {'1': 'parentBlockId', '3': 1, '4': 1, '5': 11, '6': '.blockchain.models.BlockId', '8': {}, '10': 'parentBlockId'},
    {'1': 'slot', '3': 2, '4': 1, '5': 4, '10': 'slot'},
  ],
};

/// Descriptor for `GetTotalActiveStakeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTotalActiveStakeReqDescriptor = $convert.base64Decode(
    'ChZHZXRUb3RhbEFjdGl2ZVN0YWtlUmVxEkoKDXBhcmVudEJsb2NrSWQYASABKAsyGi5ibG9ja2'
    'NoYWluLm1vZGVscy5CbG9ja0lkQgj6QgWKAQIQAVINcGFyZW50QmxvY2tJZBISCgRzbG90GAIg'
    'ASgEUgRzbG90');

@$core.Deprecated('Use getTotalActiveStakeResDescriptor instead')
const GetTotalActiveStakeRes$json = {
  '1': 'GetTotalActiveStakeRes',
  '2': [
    {'1': 'totalActiveStake', '3': 1, '4': 1, '5': 3, '10': 'totalActiveStake'},
  ],
};

/// Descriptor for `GetTotalActiveStakeRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTotalActiveStakeResDescriptor = $convert.base64Decode(
    'ChZHZXRUb3RhbEFjdGl2ZVN0YWtlUmVzEioKEHRvdGFsQWN0aXZlU3Rha2UYASABKANSEHRvdG'
    'FsQWN0aXZlU3Rha2U=');

@$core.Deprecated('Use calculateEtaReqDescriptor instead')
const CalculateEtaReq$json = {
  '1': 'CalculateEtaReq',
  '2': [
    {'1': 'parentBlockId', '3': 1, '4': 1, '5': 11, '6': '.blockchain.models.BlockId', '8': {}, '10': 'parentBlockId'},
    {'1': 'slot', '3': 2, '4': 1, '5': 4, '10': 'slot'},
  ],
};

/// Descriptor for `CalculateEtaReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calculateEtaReqDescriptor = $convert.base64Decode(
    'Cg9DYWxjdWxhdGVFdGFSZXESSgoNcGFyZW50QmxvY2tJZBgBIAEoCzIaLmJsb2NrY2hhaW4ubW'
    '9kZWxzLkJsb2NrSWRCCPpCBYoBAhABUg1wYXJlbnRCbG9ja0lkEhIKBHNsb3QYAiABKARSBHNs'
    'b3Q=');

@$core.Deprecated('Use calculateEtaResDescriptor instead')
const CalculateEtaRes$json = {
  '1': 'CalculateEtaRes',
  '2': [
    {'1': 'eta', '3': 1, '4': 1, '5': 12, '8': {}, '10': 'eta'},
  ],
};

/// Descriptor for `CalculateEtaRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calculateEtaResDescriptor = $convert.base64Decode(
    'Cg9DYWxjdWxhdGVFdGFSZXMSGQoDZXRhGAEgASgMQgf6QgR6AmggUgNldGE=');

@$core.Deprecated('Use packBlockReqDescriptor instead')
const PackBlockReq$json = {
  '1': 'PackBlockReq',
  '2': [
    {'1': 'parentBlockId', '3': 1, '4': 1, '5': 11, '6': '.blockchain.models.BlockId', '8': {}, '10': 'parentBlockId'},
    {'1': 'untilSlot', '3': 2, '4': 1, '5': 4, '10': 'untilSlot'},
  ],
};

/// Descriptor for `PackBlockReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List packBlockReqDescriptor = $convert.base64Decode(
    'CgxQYWNrQmxvY2tSZXESSgoNcGFyZW50QmxvY2tJZBgBIAEoCzIaLmJsb2NrY2hhaW4ubW9kZW'
    'xzLkJsb2NrSWRCCPpCBYoBAhABUg1wYXJlbnRCbG9ja0lkEhwKCXVudGlsU2xvdBgCIAEoBFIJ'
    'dW50aWxTbG90');

@$core.Deprecated('Use packBlockResDescriptor instead')
const PackBlockRes$json = {
  '1': 'PackBlockRes',
  '2': [
    {'1': 'body', '3': 1, '4': 1, '5': 11, '6': '.blockchain.models.BlockBody', '8': {}, '10': 'body'},
  ],
};

/// Descriptor for `PackBlockRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List packBlockResDescriptor = $convert.base64Decode(
    'CgxQYWNrQmxvY2tSZXMSOgoEYm9keRgBIAEoCzIcLmJsb2NrY2hhaW4ubW9kZWxzLkJsb2NrQm'
    '9keUII+kIFigECEAFSBGJvZHk=');

