import 'package:characters_app/app/core/entities/image.dart';
import 'package:characters_app/app/features/character/domain/entities/character.dart';
import 'package:characters_app/app/features/character/domain/entities/response_character.dart';
import 'package:characters_app/app/features/character/domain/repositories/character_repository.dart';
import 'package:characters_app/app/features/character/domain/usecases/get_characters.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  late GetCharacters usecase;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    usecase = GetCharacters(mockCharacterRepository);
  });

  final params = GetCharactersParams();

  final tThumbnail = Image(
    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
    extension: "jpg",
  );
  final tCharacters = List<Character>.from(
    [
      Character(
        id: 1011334,
        name: "3-D Man",
        description: "Test",
        thumbnail: tThumbnail,
      ),
    ],
  );
  final tResponseCharactersModel = ResponseCharacter(
    haveMore: false,
    characters: tCharacters,
  );

  test('should get the characters from the repository', () async {
    when(() => mockCharacterRepository.getCharacters(offset: params.offset))
        .thenAnswer((_) async => Right(tResponseCharactersModel));

    final result = await usecase(params);

    expect(result, Right(tResponseCharactersModel));
    verify(() => mockCharacterRepository.getCharacters(offset: params.offset));
    verifyNoMoreInteractions(mockCharacterRepository);
  });
}
