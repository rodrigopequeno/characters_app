import 'package:characters_app/app/core/entities/response_data.dart';
import 'package:characters_app/app/core/error/exceptions.dart';
import 'package:characters_app/app/core/error/failure.dart';
import 'package:characters_app/app/core/models/image_model.dart';
import 'package:characters_app/app/core/network/network_info.dart';
import 'package:characters_app/app/features/comics/data/datasources/comics_remote_data_source.dart';
import 'package:characters_app/app/features/comics/data/models/comic_model.dart';
import 'package:characters_app/app/features/comics/data/models/response_comics_model.dart';
import 'package:characters_app/app/features/comics/data/repositories/comics_repository_impl.dart';
import 'package:characters_app/app/features/comics/domain/repositories/comics_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockComicsRemoteDataSource extends Mock
    implements ComicsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  const offset = 0;
  const characterId = 0;
  late ComicsRepository repositoryImpl;
  late MockComicsRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    registerFallbackValue<List<ComicModel>>(<ComicModel>[]);
  });

  setUp(() {
    mockRemoteDataSource = MockComicsRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = ComicsRepositoryImpl(
      comicsRemoteDataSource: mockRemoteDataSource,
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

  group('getComics', () {
    final tThumbnailModel = ImageModel(
      path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
      extension: "jpg",
    );
    final tComicsModel = List<ComicModel>.from(
      [
        ComicModel(
          id: 1011334,
          description: "Comic Description",
          thumbnailModel: tThumbnailModel,
          imagesModel: [tThumbnailModel, tThumbnailModel],
          title: "Comic Title",
          variantDescription: "Comic variantDescription",
        ),
      ],
    );
    final tResponseComics = ResponseComicsModel(
      offset: offset,
      limit: 20,
      total: 40,
      count: 20,
      comics: tComicsModel,
    );

    test('should check if the device is online', () async {
      final futureComicsModel = Future.value(tResponseComics);
      when(
        () => mockRemoteDataSource.getComics(
          offset: offset,
          characterId: characterId,
        ),
      ).thenAnswer((_) async => futureComicsModel);
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repositoryImpl.getComics(offset: offset, characterId: characterId);
      verify(() => mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
        '''should return remote data when the call to remote data source is successful''',
        () async {
          final futureComicsModel = Future.value(tResponseComics);
          when(
            () => mockRemoteDataSource.getComics(
              offset: offset,
              characterId: characterId,
            ),
          ).thenAnswer((_) async => futureComicsModel);

          final result = await repositoryImpl.getComics(
            offset: offset,
            characterId: characterId,
          );
          verify(
            () => mockRemoteDataSource.getComics(
              offset: offset,
              characterId: characterId,
            ),
          );
          expect(result, isA<Right<Failure, ResponseData>>());
        },
      );

      test(
        '''
should return server failure when the call to remote data source is unsuccessful''',
        () async {
          when(
            () => mockRemoteDataSource.getComics(
              offset: offset,
              characterId: characterId,
            ),
          ).thenThrow(ServerException());
          final result = await repositoryImpl.getComics(
            offset: offset,
            characterId: characterId,
          );
          verify(
            () => mockRemoteDataSource.getComics(
              offset: offset,
              characterId: characterId,
            ),
          );
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        '''should return NoInternetConnection''',
        () async {
          final result = await repositoryImpl.getComics(
            offset: offset,
            characterId: characterId,
          );
          expect(result, equals(Left(NoInternetConnectionFailure())));
        },
      );
    });
  });
}
