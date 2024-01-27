//
//  Generated code. Do not modify.
//  source: services/reducer.proto
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

import 'reducer.pb.dart' as $0;

export 'reducer.pb.dart';

@$pb.GrpcServiceName('blockchain.services.Reducer')
class ReducerClient extends $grpc.Client {
  static final _$createReducer = $grpc.ClientMethod<$0.CreateReducerReq, $0.CreateReducerRes>(
      '/blockchain.services.Reducer/CreateReducer',
      ($0.CreateReducerReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateReducerRes.fromBuffer(value));
  static final _$currentReducerState = $grpc.ClientMethod<$0.ReducerStateReq, $0.ReducerStateRes>(
      '/blockchain.services.Reducer/CurrentReducerState',
      ($0.ReducerStateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReducerStateRes.fromBuffer(value));
  static final _$streamedReducerState = $grpc.ClientMethod<$0.ReducerStateReq, $0.ReducerStateRes>(
      '/blockchain.services.Reducer/StreamedReducerState',
      ($0.ReducerStateReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReducerStateRes.fromBuffer(value));

  ReducerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateReducerRes> createReducer($0.CreateReducerReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createReducer, request, options: options);
  }

  $grpc.ResponseFuture<$0.ReducerStateRes> currentReducerState($0.ReducerStateReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$currentReducerState, request, options: options);
  }

  $grpc.ResponseStream<$0.ReducerStateRes> streamedReducerState($0.ReducerStateReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamedReducerState, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('blockchain.services.Reducer')
abstract class ReducerServiceBase extends $grpc.Service {
  $core.String get $name => 'blockchain.services.Reducer';

  ReducerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateReducerReq, $0.CreateReducerRes>(
        'CreateReducer',
        createReducer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateReducerReq.fromBuffer(value),
        ($0.CreateReducerRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReducerStateReq, $0.ReducerStateRes>(
        'CurrentReducerState',
        currentReducerState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReducerStateReq.fromBuffer(value),
        ($0.ReducerStateRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReducerStateReq, $0.ReducerStateRes>(
        'StreamedReducerState',
        streamedReducerState_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ReducerStateReq.fromBuffer(value),
        ($0.ReducerStateRes value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateReducerRes> createReducer_Pre($grpc.ServiceCall call, $async.Future<$0.CreateReducerReq> request) async {
    return createReducer(call, await request);
  }

  $async.Future<$0.ReducerStateRes> currentReducerState_Pre($grpc.ServiceCall call, $async.Future<$0.ReducerStateReq> request) async {
    return currentReducerState(call, await request);
  }

  $async.Stream<$0.ReducerStateRes> streamedReducerState_Pre($grpc.ServiceCall call, $async.Future<$0.ReducerStateReq> request) async* {
    yield* streamedReducerState(call, await request);
  }

  $async.Future<$0.CreateReducerRes> createReducer($grpc.ServiceCall call, $0.CreateReducerReq request);
  $async.Future<$0.ReducerStateRes> currentReducerState($grpc.ServiceCall call, $0.ReducerStateReq request);
  $async.Stream<$0.ReducerStateRes> streamedReducerState($grpc.ServiceCall call, $0.ReducerStateReq request);
}
