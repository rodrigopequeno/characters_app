import 'package:characters_app/app/core/error/exceptions.dart';
import 'package:characters_app/app/core/service/response_service.dart';
import 'package:characters_app/app/core/service/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Service serviceImpl;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    serviceImpl = ServiceImpl(client: mockDio);
  });

  group('get', () {
    test(
      'should forward the call to Dio.get',
      () async {
        final tDioGet = Response<String>(
          data: "test",
          requestOptions: RequestOptions(path: "url"),
          statusCode: 200,
          statusMessage: "test message",
        );
        final tFutureDioGet = Future.value(tDioGet);
        final tResponseService = ResponseService<String>(
          data: tDioGet.data,
          requestPath: tDioGet.requestOptions.path,
          statusCode: tDioGet.statusCode,
          statusMessage: tDioGet.statusMessage,
        );
        when(() => mockDio.get<String>(any())).thenAnswer((_) => tFutureDioGet);
        final result = await serviceImpl.get<String>("url");
        verify(() => mockDio.get<String>(any()));
        expect(result, tResponseService);
        expect(result.hashCode, tResponseService.hashCode);
      },
    );

    test(
      'should return ServiceException in case of DioError',
      () async {
        final requestOptions = RequestOptions(path: "url");
        when(() => mockDio.get<String>(any()))
            .thenThrow(DioError(requestOptions: requestOptions));
        final call = serviceImpl.get;
        expect(() => call("url"), throwsA(isA<ServiceException>()));
      },
    );
  });
}
