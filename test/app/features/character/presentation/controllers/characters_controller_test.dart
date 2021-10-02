import 'package:characters_app/app/core/error/failure.dart';
import 'package:characters_app/app/features/character/data/models/character_model.dart';
import 'package:characters_app/app/features/character/data/models/comic_model.dart';
import 'package:characters_app/app/features/character/data/models/comics_model.dart';
import 'package:characters_app/app/features/character/data/models/response_character_model.dart';
import 'package:characters_app/app/features/character/data/models/thumbnail_model.dart';
import 'package:characters_app/app/features/character/domain/usecases/get_characters.dart';
import 'package:characters_app/app/features/character/presentation/controllers/characters_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';

class MockGetCharacters extends Mock implements GetCharacters {}

void main() {
  late CharactersController controller;
  late MockGetCharacters mockGetCharacters;

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
  final tCharactersModel = [
    CharacterModel(
      id: 1011334,
      name: "3-D Man",
      description: "Test",
      comicsModel: tComicsModel,
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
        final changedCharactersLoading = <bool>[];
        final changedCharacters = <int>[];
        when(() => mockGetCharacters(any()))
            .thenAnswer((_) async => Right(tResponseCharacters));
        mobx.reaction<bool>(
          (_) => controller.charactersLoading,
          (newValue) => changedCharactersLoading.add(newValue),
        );
        mobx.reaction<List>(
          (_) => controller.characters,
          (newValue) => changedCharacters.add(newValue.length),
        );
        //act
        controller.loadCharacters();
        await untilCalled(() => mockGetCharacters(any()));
        //verify
        expect(changedCharactersLoading, [true, false]);
        expect(changedCharacters.length, tCharactersModel.length);
      },
    );

    test(
      'should emit loading and error when getting data fails',
      () async {
        final changedCharactersLoading = <bool>[];
        final changedCharactersError = <String>[];
        when(() => mockGetCharacters(any()))
            .thenAnswer((_) async => Left(ServerFailure()));
        mobx.reaction<bool>(
          (_) => controller.charactersLoading,
          (newValue) => changedCharactersLoading.add(newValue),
        );
        mobx.reaction<String>(
          (_) => controller.charactersError,
          (newValue) => changedCharactersError.add(newValue),
        );
        //act
        controller.loadCharacters();
        await untilCalled(() => mockGetCharacters(any()));
        //verify
        expect(changedCharactersLoading, [true, false]);
        expect(changedCharactersError.length, 1);
      },
    );

    test(
      'should emit loading and error with a proper message for the error when getting data fails',
      () async {
        final changedCharactersLoading = <bool>[];
        final changedCharactersError = <String>[];
        when(() => mockGetCharacters(any()))
            .thenAnswer((_) async => Left(NoInternetConnectionFailure()));
        mobx.reaction<bool>(
          (_) => controller.charactersLoading,
          (newValue) => changedCharactersLoading.add(newValue),
        );
        mobx.reaction<String>(
          (_) => controller.charactersError,
          (newValue) => changedCharactersError.add(newValue),
        );
        //act
        controller.loadCharacters();
        await untilCalled(() => mockGetCharacters(any()));
        //verify
        expect(changedCharactersLoading, [true, false]);
        expect(changedCharactersError, [
          'You have no internet access, check your connection',
        ]);
      },
    );
  });
}
