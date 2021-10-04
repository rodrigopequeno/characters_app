import 'package:characters_app/app/core/models/image_model.dart';
import 'package:characters_app/app/features/character/data/models/character_model.dart';
import 'package:characters_app/app/features/character/data/models/response_character_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tThumbnailModel = ImageModel(
    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
    extension: "jpg",
  );
  final tCharactersModel = CharacterModel(
    id: 1011334,
    name: "3-D Man",
    description: "Test",
    thumbnailModel: tThumbnailModel,
  );
  final tResponseCharacter = ResponseCharacterModel(
    characters: List.generate(20, (index) => tCharactersModel),
    count: 20,
    limit: 20,
    offset: 20,
    total: 500,
  );

  group("nextOffset", () {
    test('should return offset value to bring more data', () async {
      final _nextOffsetExpected =
          tResponseCharacter.offset + tResponseCharacter.count;

      expect(tResponseCharacter.nextOffset, _nextOffsetExpected);
    });
  });

  group("hashCode", () {
    test('should return hash code based on all attributes', () async {
      final result = tResponseCharacter.hashCode;

      final expected = tResponseCharacter.offset.hashCode ^
          tResponseCharacter.limit.hashCode ^
          tResponseCharacter.total.hashCode ^
          tResponseCharacter.count.hashCode;

      expect(result, expected);
    });
  });
}
