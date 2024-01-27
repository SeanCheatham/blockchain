//
//  Generated code. Do not modify.
//  source: services/node_rpc.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'node_rpc.pb.dart' as $2;

export 'node_rpc.pb.dart';

@$pb.GrpcServiceName('blockchain.services.NodeRpc')
class NodeRpcClient extends $grpc.Client {
  static final _$broadcastTransaction = $grpc.ClientMethod<$2.BroadcastTransactionReq, $2.BroadcastTransactionRes>(
      '/blockchain.services.NodeRpc/BroadcastTransaction',
      ($2.BroadcastTransactionReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.BroadcastTransactionRes.fromBuffer(value));
  static final _$getBlockHeader = $grpc.ClientMethod<$2.GetBlockHeaderReq, $2.GetBlockHeaderRes>(
      '/blockchain.services.NodeRpc/GetBlockHeader',
      ($2.GetBlockHeaderReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetBlockHeaderRes.fromBuffer(value));
  static final _$getBlockBody = $grpc.ClientMethod<$2.GetBlockBodyReq, $2.GetBlockBodyRes>(
      '/blockchain.services.NodeRpc/GetBlockBody',
      ($2.GetBlockBodyReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetBlockBodyRes.fromBuffer(value));
  static final _$getFullBlock = $grpc.ClientMethod<$2.GetFullBlockReq, $2.GetFullBlockRes>(
      '/blockchain.services.NodeRpc/GetFullBlock',
      ($2.GetFullBlockReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetFullBlockRes.fromBuffer(value));
  static final _$getTransaction = $grpc.ClientMethod<$2.GetTransactionReq, $2.GetTransactionRes>(
      '/blockchain.services.NodeRpc/GetTransaction',
      ($2.GetTransactionReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetTransactionRes.fromBuffer(value));
  static final _$getBlockIdAtHeight = $grpc.ClientMethod<$2.GetBlockIdAtHeightReq, $2.GetBlockIdAtHeightRes>(
      '/blockchain.services.NodeRpc/GetBlockIdAtHeight',
      ($2.GetBlockIdAtHeightReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetBlockIdAtHeightRes.fromBuffer(value));
  static final _$follow = $grpc.ClientMethod<$2.FollowReq, $2.FollowRes>(
      '/blockchain.services.NodeRpc/Follow',
      ($2.FollowReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.FollowRes.fromBuffer(value));

  NodeRpcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.BroadcastTransactionRes> broadcastTransaction($2.BroadcastTransactionReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$broadcastTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetBlockHeaderRes> getBlockHeader($2.GetBlockHeaderReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockHeader, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetBlockBodyRes> getBlockBody($2.GetBlockBodyReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockBody, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetFullBlockRes> getFullBlock($2.GetFullBlockReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFullBlock, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetTransactionRes> getTransaction($2.GetTransactionReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetBlockIdAtHeightRes> getBlockIdAtHeight($2.GetBlockIdAtHeightReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBlockIdAtHeight, request, options: options);
  }

  $grpc.ResponseStream<$2.FollowRes> follow($2.FollowReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$follow, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('blockchain.services.NodeRpc')
abstract class NodeRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'blockchain.services.NodeRpc';

  NodeRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.BroadcastTransactionReq, $2.BroadcastTransactionRes>(
        'BroadcastTransaction',
        broadcastTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.BroadcastTransactionReq.fromBuffer(value),
        ($2.BroadcastTransactionRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetBlockHeaderReq, $2.GetBlockHeaderRes>(
        'GetBlockHeader',
        getBlockHeader_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetBlockHeaderReq.fromBuffer(value),
        ($2.GetBlockHeaderRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetBlockBodyReq, $2.GetBlockBodyRes>(
        'GetBlockBody',
        getBlockBody_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetBlockBodyReq.fromBuffer(value),
        ($2.GetBlockBodyRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetFullBlockReq, $2.GetFullBlockRes>(
        'GetFullBlock',
        getFullBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetFullBlockReq.fromBuffer(value),
        ($2.GetFullBlockRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetTransactionReq, $2.GetTransactionRes>(
        'GetTransaction',
        getTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetTransactionReq.fromBuffer(value),
        ($2.GetTransactionRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetBlockIdAtHeightReq, $2.GetBlockIdAtHeightRes>(
        'GetBlockIdAtHeight',
        getBlockIdAtHeight_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetBlockIdAtHeightReq.fromBuffer(value),
        ($2.GetBlockIdAtHeightRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.FollowReq, $2.FollowRes>(
        'Follow',
        follow_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.FollowReq.fromBuffer(value),
        ($2.FollowRes value) => value.writeToBuffer()));
  }

  $async.Future<$2.BroadcastTransactionRes> broadcastTransaction_Pre($grpc.ServiceCall call, $async.Future<$2.BroadcastTransactionReq> request) async {
    return broadcastTransaction(call, await request);
  }

  $async.Future<$2.GetBlockHeaderRes> getBlockHeader_Pre($grpc.ServiceCall call, $async.Future<$2.GetBlockHeaderReq> request) async {
    return getBlockHeader(call, await request);
  }

  $async.Future<$2.GetBlockBodyRes> getBlockBody_Pre($grpc.ServiceCall call, $async.Future<$2.GetBlockBodyReq> request) async {
    return getBlockBody(call, await request);
  }

  $async.Future<$2.GetFullBlockRes> getFullBlock_Pre($grpc.ServiceCall call, $async.Future<$2.GetFullBlockReq> request) async {
    return getFullBlock(call, await request);
  }

  $async.Future<$2.GetTransactionRes> getTransaction_Pre($grpc.ServiceCall call, $async.Future<$2.GetTransactionReq> request) async {
    return getTransaction(call, await request);
  }

  $async.Future<$2.GetBlockIdAtHeightRes> getBlockIdAtHeight_Pre($grpc.ServiceCall call, $async.Future<$2.GetBlockIdAtHeightReq> request) async {
    return getBlockIdAtHeight(call, await request);
  }

  $async.Stream<$2.FollowRes> follow_Pre($grpc.ServiceCall call, $async.Future<$2.FollowReq> request) async* {
    yield* follow(call, await request);
  }

  $async.Future<$2.BroadcastTransactionRes> broadcastTransaction($grpc.ServiceCall call, $2.BroadcastTransactionReq request);
  $async.Future<$2.GetBlockHeaderRes> getBlockHeader($grpc.ServiceCall call, $2.GetBlockHeaderReq request);
  $async.Future<$2.GetBlockBodyRes> getBlockBody($grpc.ServiceCall call, $2.GetBlockBodyReq request);
  $async.Future<$2.GetFullBlockRes> getFullBlock($grpc.ServiceCall call, $2.GetFullBlockReq request);
  $async.Future<$2.GetTransactionRes> getTransaction($grpc.ServiceCall call, $2.GetTransactionReq request);
  $async.Future<$2.GetBlockIdAtHeightRes> getBlockIdAtHeight($grpc.ServiceCall call, $2.GetBlockIdAtHeightReq request);
  $async.Stream<$2.FollowRes> follow($grpc.ServiceCall call, $2.FollowReq request);
}
