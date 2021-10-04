import 'package:dio/dio.dart';

import '../../generate_hash/generate_hash.dart';

class ParameterInterceptors extends Interceptor {
  final GenerateHash generateHash;

  ParameterInterceptors({required this.generateHash});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final timestamp = generateHash.timestamp;
    final hash = generateHash(timestamp);
    options.queryParameters.addAll(
      {
        "ts": timestamp,
        "hash": hash,
      },
    );

    return super.onRequest(options, handler);
  }
}
