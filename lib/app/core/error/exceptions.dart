class ServerException implements Exception {}

class ServiceException implements Exception {
  final dynamic responseData;
  final int? responseStatusCode;
  final String? responseStatusMessage;
  dynamic error;
  StackTrace? stackTrace;

  ServiceException({
    this.responseData,
    this.responseStatusCode,
    this.responseStatusMessage,
    this.stackTrace,
    this.error,
  });

  String get message => error?.toString() ?? '';

  @override
  String toString() {
    var msg = 'ServiceError: $message';
    if (stackTrace != null) {
      msg += '\n$stackTrace';
    }

    return msg;
  }
}
