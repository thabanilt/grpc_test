///
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'users.pb.dart' as $0;
export 'users.pb.dart';

class userServiceClient extends $grpc.Client {
  static final _$display = $grpc.ClientMethod<$0.information, $0.UsersResponse>(
      '/users.userService/Display',
      ($0.information value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UsersResponse.fromBuffer(value));

  userServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UsersResponse> display($0.information request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$display, request, options: options);
  }
}

abstract class userServiceBase extends $grpc.Service {
  $core.String get $name => 'users.userService';

  userServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.information, $0.UsersResponse>(
        'Display',
        display_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.information.fromBuffer(value),
        ($0.UsersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UsersResponse> display_Pre(
      $grpc.ServiceCall call, $async.Future<$0.information> request) async {
    return display(call, await request);
  }

  $async.Future<$0.UsersResponse> display(
      $grpc.ServiceCall call, $0.information request);
}
