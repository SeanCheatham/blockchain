//
//  Generated code. Do not modify.
//  source: services/node_rpc.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use broadcastTransactionReqDescriptor instead')
const BroadcastTransactionReq$json = {
  '1': 'BroadcastTransactionReq',
  '2': [
    {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.com.blockchain.models.Transaction', '10': 'transaction'},
  ],
};

/// Descriptor for `BroadcastTransactionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionReqDescriptor = $convert.base64Decode(
    'ChdCcm9hZGNhc3RUcmFuc2FjdGlvblJlcRJECgt0cmFuc2FjdGlvbhgBIAEoCzIiLmNvbS5ibG'
    '9ja2NoYWluLm1vZGVscy5UcmFuc2FjdGlvblILdHJhbnNhY3Rpb24=');

@$core.Deprecated('Use broadcastTransactionResDescriptor instead')
const BroadcastTransactionRes$json = {
  '1': 'BroadcastTransactionRes',
};

/// Descriptor for `BroadcastTransactionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastTransactionResDescriptor = $convert.base64Decode(
    'ChdCcm9hZGNhc3RUcmFuc2FjdGlvblJlcw==');

@$core.Deprecated('Use getBlockReqDescriptor instead')
const GetBlockReq$json = {
  '1': 'GetBlockReq',
  '2': [
    {'1': 'blockId', '3': 1, '4': 1, '5': 11, '6': '.com.blockchain.models.BlockId', '10': 'blockId'},
  ],
};

/// Descriptor for `GetBlockReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockReqDescriptor = $convert.base64Decode(
    'CgtHZXRCbG9ja1JlcRI4CgdibG9ja0lkGAEgASgLMh4uY29tLmJsb2NrY2hhaW4ubW9kZWxzLk'
    'Jsb2NrSWRSB2Jsb2NrSWQ=');

@$core.Deprecated('Use getBlockResDescriptor instead')
const GetBlockRes$json = {
  '1': 'GetBlockRes',
  '2': [
    {'1': 'block', '3': 1, '4': 1, '5': 11, '6': '.com.blockchain.models.Block', '10': 'block'},
  ],
};

/// Descriptor for `GetBlockRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockResDescriptor = $convert.base64Decode(
    'CgtHZXRCbG9ja1JlcxIyCgVibG9jaxgBIAEoCzIcLmNvbS5ibG9ja2NoYWluLm1vZGVscy5CbG'
    '9ja1IFYmxvY2s=');

@$core.Deprecated('Use getTransactionReqDescriptor instead')
const GetTransactionReq$json = {
  '1': 'GetTransactionReq',
  '2': [
    {'1': 'transactionId', '3': 1, '4': 1, '5': 11, '6': '.com.blockchain.models.TransactionId', '10': 'transactionId'},
  ],
};

/// Descriptor for `GetTransactionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionReqDescriptor = $convert.base64Decode(
    'ChFHZXRUcmFuc2FjdGlvblJlcRJKCg10cmFuc2FjdGlvbklkGAEgASgLMiQuY29tLmJsb2NrY2'
    'hhaW4ubW9kZWxzLlRyYW5zYWN0aW9uSWRSDXRyYW5zYWN0aW9uSWQ=');

@$core.Deprecated('Use getTransactionResDescriptor instead')
const GetTransactionRes$json = {
  '1': 'GetTransactionRes',
  '2': [
    {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.com.blockchain.models.Transaction', '10': 'transaction'},
  ],
};

/// Descriptor for `GetTransactionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionResDescriptor = $convert.base64Decode(
    'ChFHZXRUcmFuc2FjdGlvblJlcxJECgt0cmFuc2FjdGlvbhgBIAEoCzIiLmNvbS5ibG9ja2NoYW'
    'luLm1vZGVscy5UcmFuc2FjdGlvblILdHJhbnNhY3Rpb24=');

@$core.Deprecated('Use blockIdGossipReqDescriptor instead')
const BlockIdGossipReq$json = {
  '1': 'BlockIdGossipReq',
};

/// Descriptor for `BlockIdGossipReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockIdGossipReqDescriptor = $convert.base64Decode(
    'ChBCbG9ja0lkR29zc2lwUmVx');

@$core.Deprecated('Use blockIdGossipResDescriptor instead')
const BlockIdGossipRes$json = {
  '1': 'BlockIdGossipRes',
  '2': [
    {'1': 'blockId', '3': 1, '4': 1, '5': 11, '6': '.com.blockchain.models.BlockId', '10': 'blockId'},
  ],
};

/// Descriptor for `BlockIdGossipRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockIdGossipResDescriptor = $convert.base64Decode(
    'ChBCbG9ja0lkR29zc2lwUmVzEjgKB2Jsb2NrSWQYASABKAsyHi5jb20uYmxvY2tjaGFpbi5tb2'
    'RlbHMuQmxvY2tJZFIHYmxvY2tJZA==');

@$core.Deprecated('Use transactionIdGossipReqDescriptor instead')
const TransactionIdGossipReq$json = {
  '1': 'TransactionIdGossipReq',
};

/// Descriptor for `TransactionIdGossipReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionIdGossipReqDescriptor = $convert.base64Decode(
    'ChZUcmFuc2FjdGlvbklkR29zc2lwUmVx');

@$core.Deprecated('Use transactionIdGossipResDescriptor instead')
const TransactionIdGossipRes$json = {
  '1': 'TransactionIdGossipRes',
  '2': [
    {'1': 'transactionId', '3': 1, '4': 1, '5': 11, '6': '.com.blockchain.models.TransactionId', '10': 'transactionId'},
  ],
};

/// Descriptor for `TransactionIdGossipRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionIdGossipResDescriptor = $convert.base64Decode(
    'ChZUcmFuc2FjdGlvbklkR29zc2lwUmVzEkoKDXRyYW5zYWN0aW9uSWQYASABKAsyJC5jb20uYm'
    'xvY2tjaGFpbi5tb2RlbHMuVHJhbnNhY3Rpb25JZFINdHJhbnNhY3Rpb25JZA==');

