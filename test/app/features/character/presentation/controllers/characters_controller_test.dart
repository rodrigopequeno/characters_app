import 'package:characters_app/app/core/error/failure.dart';
import 'package:characters_app/app/core/models/image_model.dart';
import 'package:characters_app/app/features/character/data/models/character_model.dart';
import 'package:characters_app/app/features/character/data/models/response_character_model.dart';
import 'package:characters_app/app/features/character/domain/usecases/get_characters.dart';
import 'package:characters_app/app/features/character/presentation/controllers/characters_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';

abstract class Callable<T> {
  void call([T? arg]);
}

class MockCallable<T> extends Mock implements Callable<T> {}

class MockGetCharacters extends Mock implements GetCharacters {}

void main() {
  late CharactersController controller;
  late MockGetCharacters mockGetCharacters;

  final tThumbnailModel = ImageModel(
    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
    extension: "jpg",
  );
  final tCharactersModel = [
    CharacterModel(
      id: 1011334,
      name: "3-D Man",
      description: "Test",
      thumbnailModel: tThumbnailModel,
    ),
  ];
  final tResponseCharacters = ResponseCharacterModel(
    offset: 0,
    limit: 20,
    total: 40,
    count: 20,
    characters: tCharactersModel,
  );

  setUpAll(() {
    registerFallbackValue<GetCharactersParams>(GetCharactersParams());
  });

  setUp(() {
    mockGetCharacters = MockGetCharacters();

    controller = CharactersController(getCharacters: mockGetCharacters);
  });

  group('getCharacters', () {
    test('should get characters with use case', () async {
      when(() => mockGetCharacters(any()))
          .thenAnswer((_) async => Right(tResponseCharacters));
      controller.loadCharacters();
      await untilCalled(() => mockGetCharacters(any()));
      verify(() => mockGetCharacters(any()));
    });

    test(
      'should emit loading and return the update the data when getting characters successfully',
      () async {
        //arrange
        final changedCharactersLoading = MockCallable<bool>();
        when(() => mockGetCharacters(any()))
            .thenAnswer((_) async => Right(tResponseCharacters));
        mobx.reaction<bool>(
          (_) => controller.charactersLoading,
          (newValue) => changedCharactersLoading(newValue),
        );
        //act
        await controller.loadCharacters();
        await untilCalled(() => mockGetCharacters(any()));
        //verify
        verifyInOrder([
          () => changedCharactersLoading(true),
          () => changedCharactersLoading(false),
        ]);
        expect(controller.characters, tCharactersModel);
      },
    );

    test(
      'should emit loading and error when getting data fails',
      () async {
        //arrange
        final changedCharactersLoading = MockCallable<bool>();
        final changedCharactersError = MockCallable<String>();
        when(() => mockGetCharacters(any()))
            .thenAnswer((_) async => Left(ServerFailure()));
        mobx.reaction<bool>(
          (_) => controller.charactersLoading,
          (newValue) => changedCharactersLoading(newValue),
        );
        mobx.reaction<String>(
          (_) => controller.charactersError,
          (newValue) => changedCharactersError(newValue),
        );
        //act
        controller.loadCharacters();
        await untilCalled(() => mockGetCharacters(any()));
        //verify
        verifyInOrder([
          () => changedCharactersLoading(true),
          () => changedCharactersLoading(false),
        ]);
        verifyInOrder([
          () => changedCharactersError(
                "An error has occurred, check your connection",
              ),
        ]);
      },
    );

    test(
      'should emit loading and error with a proper message for the error when getting data fails',
      () async {
        //arrange
        final changedCharactersLoading = MockCallable<bool>();
        final changedCharactersError = MockCallable<String>();
        when(() => mockGetCharacters(any()))
            .thenAnswer((_) async => Left(NoInternetConnectionFailure()));
        mobx.reaction<bool>(
          (_) => controller.charactersLoading,
          (newValue) => changedCharactersLoading(newValue),
        );
        mobx.reaction<String>(
          (_) => controller.charactersError,
          (newValue) => changedCharactersError(newValue),
        );
        //act
        controller.loadCharacters();
        await untilCalled(() => mockGetCharacters(any()));
        //verify
        verifyInOrder([
          () => changedCharactersLoading(true),
          () => changedCharactersLoading(false),
        ]);
        verifyInOrder([
          () => changedCharactersError(
                'You have no internet access, check your connection',
              ),
        ]);
      },
    );
  });
}
