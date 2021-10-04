import 'dart:convert';

import 'package:characters_app/app/core/error/exceptions.dart';
import 'package:characters_app/app/core/service/response_service.dart';
import 'package:characters_app/app/core/service/service.dart';
import 'package:characters_app/app/features/comics/data/datasources/comics_remote_data_source.dart';
import 'package:characters_app/app/features/comics/data/models/response_comics_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixture_reader.dart';

class MockService extends Mock implements Service {}

void main() {
  const offset = 0;
  const characterId = 0;
  late ComicsRemoteDataSource dataSourceImpl;
  late Service mockService;

  setUp(() {
    mockService = MockService();
    dataSourceImpl = ComicsRemoteDataSourceImpl(service: mockService);
  });

  void setUpMockClientSuccess200() {
    when(
      () => mockService.get(
        any(),
        queryParameters: any(named: "queryParameters"),
      ),
    ).thenAnswer(
      (_) async => ResponseService(
        requestPath: '',
        data: json.decode(fixture('comics.json')),
        statusCode: 200,
      ),
    );
  }

  void setupUpMockClientFailure409() {
    when(
      () => mockService.get(
        any(),
        queryParameters: any(named: "queryParameters"),
      ),
    ).thenAnswer(
      (_) async => ResponseService(
        requestPath: '',
        data: "Invalid value passed to filter.",
        statusCode: 409,
      ),
    );
  }

  group('getComics', () {
    final tResponseComicsModel = ResponseComicsModel.fromMap(
      (json.decode(fixture('comics.json')) as Map<String, dynamic>)["data"]
          as Map<String, dynamic>,
    );
    test(
      'should perform a GET request on a URL to get Comics',
      () async {
        setUpMockClientSuccess200();
        dataSourceImpl.getComics(offset: offset, characterId: characterId);
        verify(
          () => mockService
              .get('/characters/0/comics', queryParameters: {"offset": offset}),
        );
      },
    );

    test(
      'should return Comics when the response code is 200 (success)',
      () async {
        setUpMockClientSuccess200();
        final result = await dataSourceImpl.getComics(
          offset: offset,
          characterId: characterId,
        );
        expect(result, equals(tResponseComicsModel));
      },
    );

    test(
      'should return next Comics when the response code is 200 (success)',
      () async {
        final tResponseComicsModelNext = ResponseComicsModel.fromMap(
          (json.decode(fixture('comics_next.json'))
              as Map<String, dynamic>)["data"] as Map<String, dynamic>,
        );
        when(
          () => mockService.get(
            any(),
            queryParameters: any(named: "queryParameters"),
          ),
        ).thenAnswer(
          (_) async => ResponseService(
            requestPath: '',
            data: json.decode(fixture('comics.json')),
            statusCode: 200,
          ),
        );
        final result = await dataSourceImpl.getComics(characterId: characterId);
        expect(result, equals(tResponseComicsModel));
        when(
          () => mockService.get(
            any(),
            queryParameters: any(named: "queryParameters"),
          ),
        ).thenAnswer(
          (_) async => ResponseService(
            requestPath: '',
            data: json.decode(fixture('comics_next.json')),
            statusCode: 200,
          ),
        );
        final resultNext = await dataSourceImpl.getComics(
          next: true,
          characterId: characterId,
        );
        expect(result, isNot(equals(resultNext)));
        expect(resultNext, equals(tResponseComicsModelNext));
      },
    );

    test(
      'should throw a ServerException when the response code is 409 or other',
      () async {
        setupUpMockClientFailure409();
        final call = dataSourceImpl.getComics;
        expect(
          () => call(
            offset: offset,
            characterId: characterId,
          ),
          throwsA(isA<ServerException>()),
        );
      },
    );

    test(
      'should throw a ServerException when an error occurs in the request',
      () async {
        when(
          () => mockService.get(
            any(),
            queryParameters: any(named: "queryParameters"),
          ),
        ).thenThrow(
          ServiceException(),
        );
        final call = dataSourceImpl.getComics;
        expect(
          () => call(
            offset: offset,
            characterId: characterId,
          ),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });
}
