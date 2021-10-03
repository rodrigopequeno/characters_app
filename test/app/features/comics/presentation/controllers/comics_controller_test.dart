import 'package:characters_app/app/core/error/failure.dart';
import 'package:characters_app/app/core/models/image_model.dart';
import 'package:characters_app/app/features/comics/data/models/comic_model.dart';
import 'package:characters_app/app/features/comics/data/models/response_comics_model.dart';
import 'package:characters_app/app/features/comics/domain/usecases/get_comics.dart';
import 'package:characters_app/app/features/comics/presentation/controllers/comics_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/callable.dart';

class MockGetComics extends Mock implements GetComics {}

void main() {
  const characterId = 0;
  late ComicsController controller;
  late MockGetComics mockGetComics;

  final tThumbnailModel = ImageModel(
    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
    extension: "jpg",
  );
  final tComicsModel = [
    ComicModel(
      id: 1011334,
      description: "Comic 2",
      thumbnailModel: tThumbnailModel,
      imagesModel: [tThumbnailModel, tThumbnailModel],
      title: 'Comic 2',
      variantDescription: 'Comic 2',
    ),
  ];
  final tResponseComics = ResponseComicsModel(
    offset: 0,
    limit: 20,
    total: 40,
    count: 20,
    comics: tComicsModel,
  );

  setUpAll(() {
    registerFallbackValue<GetComicsParams>(
      GetComicsParams(
        characterId: characterId,
      ),
    );
  });

  setUp(() {
    mockGetComics = MockGetComics();

    controller = ComicsController(
      getComics: mockGetComics,
      characterId: characterId,
    );
  });

  group('getComics', () {
    test('should get characters with use case', () async {
      when(() => mockGetComics(any()))
          .thenAnswer((_) async => Right(tResponseComics));
      controller.loadComics();
      await untilCalled(() => mockGetComics(any()));
      verify(() => mockGetComics(any()));
    });

    test(
      'should emit loading and return the update the data when getting characters successfully',
      () async {
        //arrange
        final changedComicsLoading = MockCallable<bool>();
        when(() => mockGetComics(any()))
            .thenAnswer((_) async => Right(tResponseComics));
        mobx.reaction<bool>(
          (_) => controller.comicsLoading,
          (newValue) => changedComicsLoading(newValue),
        );
        //act
        await controller.loadComics();
        await untilCalled(() => mockGetComics(any()));
        //verify
        verifyInOrder([
          () => changedComicsLoading(true),
          () => changedComicsLoading(false),
        ]);
        expect(controller.comics, tComicsModel);
      },
    );

    test(
      'should emit loading and error when getting data fails',
      () async {
        //arrange
        final changedComicsLoading = MockCallable<bool>();
        final changedComicsError = MockCallable<String>();
        when(() => mockGetComics(any()))
            .thenAnswer((_) async => Left(ServerFailure()));
        mobx.reaction<bool>(
          (_) => controller.comicsLoading,
          (newValue) => changedComicsLoading(newValue),
        );
        mobx.reaction<String>(
          (_) => controller.comicsError,
          (newValue) => changedComicsError(newValue),
        );
        //act
        controller.loadComics();
        await untilCalled(() => mockGetComics(any()));
        //verify
        verifyInOrder([
          () => changedComicsLoading(true),
          () => changedComicsLoading(false),
        ]);
        verifyInOrder([
          () => changedComicsError(
                "An error has occurred, check your connection",
              ),
        ]);
      },
    );

    test(
      'should emit loading and error with a proper message for the error when getting data fails',
      () async {
        //arrange
        final changedComicsLoading = MockCallable<bool>();
        final changedComicsError = MockCallable<String>();
        when(() => mockGetComics(any()))
            .thenAnswer((_) async => Left(NoInternetConnectionFailure()));
        mobx.reaction<bool>(
          (_) => controller.comicsLoading,
          (newValue) => changedComicsLoading(newValue),
        );
        mobx.reaction<String>(
          (_) => controller.comicsError,
          (newValue) => changedComicsError(newValue),
        );
        //act
        controller.loadComics();
        await untilCalled(() => mockGetComics(any()));
        //verify
        verifyInOrder([
          () => changedComicsLoading(true),
          () => changedComicsLoading(false),
        ]);
        verifyInOrder([
          () => changedComicsError(
                'You have no internet access, check your connection',
              ),
        ]);
      },
    );
  });

  group('getNextComics', () {
    final tResponseComicsNext = ResponseComicsModel(
      offset: 20,
      limit: 20,
      total: 40,
      count: 20,
      comics: tComicsModel,
    );
    final comicsResultFromNext = [...tComicsModel, ...tComicsModel];

    setUp(() async {
      when(() => mockGetComics(any()))
          .thenAnswer((_) async => Right(tResponseComics));
      controller.loadComics();
      await untilCalled(() => mockGetComics(any()));
      reset(mockGetComics);
    });

    test('should get next comics with use case', () async {
      when(() => mockGetComics(any()))
          .thenAnswer((_) async => Right(tResponseComicsNext));
      controller.loadNextComics();
      await untilCalled(() => mockGetComics(any()));
      verify(() => mockGetComics(any()));
    });

    test(
      'should emit loading and return the update the data when getting next comics successfully',
      () async {
        //arrange
        final changedNextComicsLoading = MockCallable<bool>();
        when(() => mockGetComics(any()))
            .thenAnswer((_) async => Right(tResponseComics));
        mobx.reaction<bool>(
          (_) => controller.comicsNextLoading,
          (newValue) => changedNextComicsLoading(newValue),
        );
        //act
        await controller.loadNextComics();
        await untilCalled(() => mockGetComics(any()));
        //verify
        verifyInOrder([
          () => changedNextComicsLoading(true),
          () => changedNextComicsLoading(false),
        ]);
        expect(controller.comics, comicsResultFromNext);
      },
    );

    test(
      'should emit loading and error when getting next data fails',
      () async {
        //arrange
        final changedNextComicsLoading = MockCallable<bool>();
        final changedNextComicsError = MockCallable<String>();
        when(() => mockGetComics(any()))
            .thenAnswer((_) async => Left(ServerFailure()));
        mobx.reaction<bool>(
          (_) => controller.comicsNextLoading,
          (newValue) => changedNextComicsLoading(newValue),
        );
        mobx.reaction<String>(
          (_) => controller.comicsNextError,
          (newValue) => changedNextComicsError(newValue),
        );
        //act
        controller.loadNextComics();
        await untilCalled(() => mockGetComics(any()));
        //verify
        verifyInOrder([
          () => changedNextComicsLoading(true),
          () => changedNextComicsLoading(false),
        ]);
        verifyInOrder([
          () => changedNextComicsError(
                "An error has occurred, check your connection",
              ),
        ]);
      },
    );

    test(
      'should emit loading and error with a proper message for the error when getting next data fails',
      () async {
        //arrange
        final changedNextComicsLoading = MockCallable<bool>();
        final changedNextComicsError = MockCallable<String>();
        when(() => mockGetComics(any()))
            .thenAnswer((_) async => Left(NoInternetConnectionFailure()));
        mobx.reaction<bool>(
          (_) => controller.comicsNextLoading,
          (newValue) => changedNextComicsLoading(newValue),
        );
        mobx.reaction<String>(
          (_) => controller.comicsNextError,
          (newValue) => changedNextComicsError(newValue),
        );
        //act
        controller.loadNextComics();
        await untilCalled(() => mockGetComics(any()));
        //verify
        verifyInOrder([
          () => changedNextComicsLoading(true),
          () => changedNextComicsLoading(false),
        ]);
        verifyInOrder([
          () => changedNextComicsError(
                'You have no internet access, check your connection',
              ),
        ]);
      },
    );
  });

  group('haveNext', () {
    final tResponseComicsNotMore = ResponseComicsModel(
      offset: 20,
      limit: 20,
      total: 20,
      count: 20,
      comics: tComicsModel,
    );
    test('should be true if it has more comics', () async {
      when(() => mockGetComics(any()))
          .thenAnswer((_) async => Right(tResponseComics));
      controller.loadComics();
      await untilCalled(() => mockGetComics(any()));
      expect(controller.haveNext, true);
    });

    test('should be false if there are no more comics', () async {
      when(() => mockGetComics(any()))
          .thenAnswer((_) async => Right(tResponseComicsNotMore));
      controller.loadComics();
      await untilCalled(() => mockGetComics(any()));
      expect(controller.haveNext, false);
    });
  });

  group('toString', () {
    test('should contain all observable attributes', () {
      const tExpected =
          'haveNext: true,\ncomics: [],\ncomicsLoading: false,\ncomicsError: ,\ncomicsNextLoading: false,\ncomicsNextError: \n    ';
      expect(controller.toString(), tExpected);
    });
  });
}
