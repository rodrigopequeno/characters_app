import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import 'response_service.dart';

abstract class Service {
  Future<ResponseService<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}

class ServiceImpl implements Service {
  final Dio client;

  ServiceImpl({required this.client});

  @override
  Future<ResponseService<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await client.get<T>(path, queryParameters: queryParameters);

      return ResponseService<T>(
        data: response.data,
        requestPath: response.requestOptions.path,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioError catch (e) {
      throw ServiceException(
        error: e.error,
        stackTrace: e.stackTrace,
        responseData: e.response?.data,
        responseStatusCode: e.response?.statusCode,
        responseStatusMessage: e.response?.statusMessage,
      );
    }
  }
}
