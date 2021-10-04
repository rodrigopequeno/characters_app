import 'package:characters_app/app/core/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ServiceException', () {
    const tTextError = "Ocorreu um error";
    final actualStackTrace = StackTrace.current;
    final tServiceException = ServiceException(
      error: "Ocorreu um error",
      stackTrace: actualStackTrace,
    );
    test('should return the error message', () {
      expect(tServiceException.message, tTextError);
    });
    test('should return ServiceError with message and stackTrace', () {
      final tServiceErrorDescription =
          "ServiceError: $tTextError\n$actualStackTrace";
      expect(tServiceException.toString(), tServiceErrorDescription);
    });
  });
}
