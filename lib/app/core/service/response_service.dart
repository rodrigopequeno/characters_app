import 'dart:convert';

class ResponseService<T> {
  ResponseService({
    this.data,
    this.requestPath,
    this.statusCode,
    this.statusMessage,
  });

  final T? data;
  final String? requestPath;
  final int? statusCode;
  final String? statusMessage;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }

    return data.toString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseService<T> &&
        other.data == data &&
        other.requestPath == requestPath &&
        other.statusCode == statusCode &&
        other.statusMessage == statusMessage;
  }

  @override
  int get hashCode {
    return data.hashCode ^
        requestPath.hashCode ^
        statusCode.hashCode ^
        statusMessage.hashCode;
  }
}
