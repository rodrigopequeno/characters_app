import 'dart:convert';

import 'package:characters_app/app/core/error/exceptions.dart';
import 'package:characters_app/app/core/service/response_service.dart';
import 'package:characters_app/app/core/service/service.dart';
import 'package:characters_app/app/features/character/data/datasources/character_remote_data_source.dart';
import 'package:characters_app/app/features/character/data/models/response_character_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixture_reader.dart';

class MockService extends Mock implements Service {}

void main() {
  const offset = 0;
  late CharacterRemoteDataSource dataSourceImpl;
  late Service mockService;

  setUp(() {
    mockService = MockService();
    dataSourceImpl = CharacterRemoteDataSourceImpl(service: mockService);
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
        data: json.decode(fixture('characters.json')),
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

  group('getCharacters', () {
    final tResponseCharacterModel = ResponseCharacterModel.fromMap(
      (json.decode(fixture('characters.json')) as Map<String, dynamic>)["data"]
          as Map<String, dynamic>,
    );
    test(
      'should perform a GET request on a URL to get Characters',
      () async {
        setUpMockClientSuccess200();
        dataSourceImpl.getCharacters(offset: offset);
        verify(
          () => mockService
              .get('/characters', queryParameters: {"offset": offset}),
        );
      },
    );

    test(
      'should return Characters when the response code is 200 (success)',
      () async {
        setUpMockClientSuccess200();
        final result = await dataSourceImpl.getCharacters(offset: offset);
        expect(result, equals(tResponseCharacterModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 409 or other',
      () async {
        setupUpMockClientFailure409();
        final call = dataSourceImpl.getCharacters;
        expect(() => call(offset: offset), throwsA(isA<ServerException>()));
      },
    );
  });
}
