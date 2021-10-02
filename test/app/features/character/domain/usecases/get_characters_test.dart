import 'package:characters_app/app/features/character/data/models/response_character_model.dart';
import 'package:characters_app/app/features/character/domain/entities/character.dart';
import 'package:characters_app/app/features/character/domain/entities/comic.dart';
import 'package:characters_app/app/features/character/domain/entities/comics.dart';
import 'package:characters_app/app/features/character/domain/entities/response_character.dart';
import 'package:characters_app/app/features/character/domain/entities/thumbnail.dart';
import 'package:characters_app/app/features/character/domain/repositories/character_repository.dart';
import 'package:characters_app/app/features/character/domain/usecases/get_characters.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  late GetCharacters usecase;
  late MockCharacterRepository mockPostsRepository;

  setUp(() {
    mockPostsRepository = MockCharacterRepository();
    usecase = GetCharacters(mockPostsRepository);
  });

  final params = GetCharactersParams();

  final tComics = Comics(
    available: 1,
    collectionURI:
        "http://gateway.marvel.com/v1/public/characters/1011334/comics",
    items: [
      Comic(
        resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
        name: "Avengers: The Initiative (2007) #14",
      ),
      Comic(
        resourceURI: "http://gateway.marvel.com/v1/public/comics/24571",
        name: "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)",
      ),
    ],
    returned: 2,
  );
  final tThumbnail = Thumbnail(
    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
    extension: "jpg",
  );
  final tCharacters = List<Character>.from(
    [
      Character(
        id: 1011334,
        name: "3-D Man",
        description: "Test",
        comics: tComics,
        thumbnail: tThumbnail,
      ),
    ],
  );
  final tResponseCharactersModel = ResponseCharacter(
    haveMore: false,
    characters: tCharacters,
  );

  test('should get the characters from the repository', () async {
    when(() => mockPostsRepository.getCharacters(offset: params.offset))
        .thenAnswer((_) async => Right(tResponseCharactersModel));

    final result = await usecase(params);

    expect(result, Right(tResponseCharactersModel));
    verify(() => mockPostsRepository.getCharacters(offset: params.offset));
    verifyNoMoreInteractions(mockPostsRepository);
  });
}
