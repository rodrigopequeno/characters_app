import 'package:characters_app/app/core/error/exceptions.dart';
import 'package:characters_app/app/core/error/failure.dart';
import 'package:characters_app/app/core/network/network_info.dart';
import 'package:characters_app/app/features/character/data/datasources/character_remote_data_source.dart';
import 'package:characters_app/app/features/character/data/models/character_model.dart';
import 'package:characters_app/app/features/character/data/models/comic_model.dart';
import 'package:characters_app/app/features/character/data/models/comics_model.dart';
import 'package:characters_app/app/features/character/data/models/response_character_model.dart';
import 'package:characters_app/app/features/character/data/models/thumbnail_model.dart';
import 'package:characters_app/app/features/character/data/repositories/character_repository_impl.dart';
import 'package:characters_app/app/features/character/domain/entities/response_character.dart';
import 'package:characters_app/app/features/character/domain/repositories/character_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRemoteDataSource extends Mock
    implements CharacterRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  const offset = 0;
  late CharacterRepository repositoryImpl;
  late MockCharacterRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    registerFallbackValue<List<CharacterModel>>(<CharacterModel>[]);
  });

  setUp(() {
    mockRemoteDataSource = MockCharacterRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CharacterRepositoryImpl(
      characterRemoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getCharacters', () {
    final tComicsModel = ComicsModel(
      available: 1,
      collectionURI:
          "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      itemsModel: [
        ComicModel(
          resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
          name: "Avengers: The Initiative (2007) #14",
        ),
        ComicModel(
          resourceURI: "http://gateway.marvel.com/v1/public/comics/24571",
          name: "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)",
        ),
      ],
      returned: 2,
    );
    final tThumbnailModel = ThumbnailModel(
      path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
      extension: "jpg",
    );
    final tCharactersModel = List<CharacterModel>.from(
      [
        CharacterModel(
          id: 1011334,
          name: "3-D Man",
          description: "Test",
          comicsModel: tComicsModel,
          thumbnailModel: tThumbnailModel,
        ),
      ],
    );
    final tResponseCharacters = ResponseCharacterModel(
      offset: offset,
      limit: 20,
      total: 40,
      count: 20,
      characters: tCharactersModel,
    );

    test('should check if the device is online', () async {
      final futureCharacterModel = Future.value(tResponseCharacters);
      when(() => mockRemoteDataSource.getCharacters(offset: offset))
          .thenAnswer((_) async => futureCharacterModel);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repositoryImpl.getCharacters(offset: offset);
      verify(() => mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
        '''should return remote data when the call to remote data source is successful''',
        () async {
          final futureCharacterModel = Future.value(tResponseCharacters);
          when(() => mockRemoteDataSource.getCharacters(offset: offset))
              .thenAnswer((_) async => futureCharacterModel);

          final result = await repositoryImpl.getCharacters(offset: offset);
          verify(() => mockRemoteDataSource.getCharacters(offset: offset));
          expect(result, isA<Right<Failure, ResponseCharacter>>());
        },
      );

      test(
        '''
should return server failure when the call to remote data source is unsuccessful''',
        () async {
          when(() => mockRemoteDataSource.getCharacters(offset: offset))
              .thenThrow(ServerException());
          final result = await repositoryImpl.getCharacters(offset: offset);
          verify(() => mockRemoteDataSource.getCharacters(offset: offset));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        '''should return NoInternetConnection''',
        () async {
          final result = await repositoryImpl.getCharacters(offset: offset);
          expect(result, equals(Left(NoInternetConnectionFailure())));
        },
      );
    });
  });
}
