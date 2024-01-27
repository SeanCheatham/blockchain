//
//  Generated code. Do not modify.
//  source: services/staker_support_rpc.proto
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

import 'staker_support_rpc.pb.dart' as $1;

export 'staker_support_rpc.pb.dart';

@$pb.GrpcServiceName('blockchain.services.StakerSupportRpc')
class StakerSupportRpcClient extends $grpc.Client {
  static final _$broadcastBlock = $grpc.ClientMethod<$1.BroadcastBlockReq, $1.BroadcastBlockRes>(
      '/blockchain.services.StakerSupportRpc/BroadcastBlock',
      ($1.BroadcastBlockReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.BroadcastBlockRes.fromBuffer(value));
  static final _$getStaker = $grpc.ClientMethod<$1.GetStakerReq, $1.GetStakerRes>(
      '/blockchain.services.StakerSupportRpc/GetStaker',
      ($1.GetStakerReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetStakerRes.fromBuffer(value));
  static final _$getTotalActivestake = $grpc.ClientMethod<$1.GetTotalActiveStakeReq, $1.GetTotalActiveStakeRes>(
      '/blockchain.services.StakerSupportRpc/GetTotalActivestake',
      ($1.GetTotalActiveStakeReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetTotalActiveStakeRes.fromBuffer(value));
  static final _$calculateEta = $grpc.ClientMethod<$1.CalculateEtaReq, $1.CalculateEtaRes>(
      '/blockchain.services.StakerSupportRpc/CalculateEta',
      ($1.CalculateEtaReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CalculateEtaRes.fromBuffer(value));
  static final _$packBlock = $grpc.ClientMethod<$1.PackBlockReq, $1.PackBlockRes>(
      '/blockchain.services.StakerSupportRpc/PackBlock',
      ($1.PackBlockReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.PackBlockRes.fromBuffer(value));

  StakerSupportRpcClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.BroadcastBlockRes> broadcastBlock($1.BroadcastBlockReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$broadcastBlock, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetStakerRes> getStaker($1.GetStakerReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStaker, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetTotalActiveStakeRes> getTotalActivestake($1.GetTotalActiveStakeReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTotalActivestake, request, options: options);
  }

  $grpc.ResponseFuture<$1.CalculateEtaRes> calculateEta($1.CalculateEtaReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$calculateEta, request, options: options);
  }

  $grpc.ResponseStream<$1.PackBlockRes> packBlock($1.PackBlockReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$packBlock, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('blockchain.services.StakerSupportRpc')
abstract class StakerSupportRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'blockchain.services.StakerSupportRpc';

  StakerSupportRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.BroadcastBlockReq, $1.BroadcastBlockRes>(
        'BroadcastBlock',
        broadcastBlock_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.BroadcastBlockReq.fromBuffer(value),
        ($1.BroadcastBlockRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetStakerReq, $1.GetStakerRes>(
        'GetStaker',
        getStaker_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetStakerReq.fromBuffer(value),
        ($1.GetStakerRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetTotalActiveStakeReq, $1.GetTotalActiveStakeRes>(
        'GetTotalActivestake',
        getTotalActivestake_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetTotalActiveStakeReq.fromBuffer(value),
        ($1.GetTotalActiveStakeRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CalculateEtaReq, $1.CalculateEtaRes>(
        'CalculateEta',
        calculateEta_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CalculateEtaReq.fromBuffer(value),
        ($1.CalculateEtaRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.PackBlockReq, $1.PackBlockRes>(
        'PackBlock',
        packBlock_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.PackBlockReq.fromBuffer(value),
        ($1.PackBlockRes value) => value.writeToBuffer()));
  }

  $async.Future<$1.BroadcastBlockRes> broadcastBlock_Pre($grpc.ServiceCall call, $async.Future<$1.BroadcastBlockReq> request) async {
    return broadcastBlock(call, await request);
  }

  $async.Future<$1.GetStakerRes> getStaker_Pre($grpc.ServiceCall call, $async.Future<$1.GetStakerReq> request) async {
    return getStaker(call, await request);
  }

  $async.Future<$1.GetTotalActiveStakeRes> getTotalActivestake_Pre($grpc.ServiceCall call, $async.Future<$1.GetTotalActiveStakeReq> request) async {
    return getTotalActivestake(call, await request);
  }

  $async.Future<$1.CalculateEtaRes> calculateEta_Pre($grpc.ServiceCall call, $async.Future<$1.CalculateEtaReq> request) async {
    return calculateEta(call, await request);
  }

  $async.Stream<$1.PackBlockRes> packBlock_Pre($grpc.ServiceCall call, $async.Future<$1.PackBlockReq> request) async* {
    yield* packBlock(call, await request);
  }

  $async.Future<$1.BroadcastBlockRes> broadcastBlock($grpc.ServiceCall call, $1.BroadcastBlockReq request);
  $async.Future<$1.GetStakerRes> getStaker($grpc.ServiceCall call, $1.GetStakerReq request);
  $async.Future<$1.GetTotalActiveStakeRes> getTotalActivestake($grpc.ServiceCall call, $1.GetTotalActiveStakeReq request);
  $async.Future<$1.CalculateEtaRes> calculateEta($grpc.ServiceCall call, $1.CalculateEtaReq request);
  $async.Stream<$1.PackBlockRes> packBlock($grpc.ServiceCall call, $1.PackBlockReq request);
}
