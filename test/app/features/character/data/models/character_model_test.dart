import 'dart:convert';

import 'package:characters_app/app/core/models/image_model.dart';
import 'package:characters_app/app/features/character/data/models/character_model.dart';
import 'package:characters_app/app/features/character/domain/entities/character.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

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

  test('should be a subclass of Character entity', () async {
    expect(tCharactersModel, isA<Character>());
  });

  group("fromMap", () {
    test('should return a valid model when from JSON', () async {
      final jsonMap =
          json.decode(fixture("character.json")) as Map<String, dynamic>;

      final result = CharacterModel.fromMap(jsonMap);

      expect(result, tCharactersModel);
    });
  });

  group("toJson", () {
    test('should return a JSON map containing the proper data', () async {
      final result = tCharactersModel.toMap();

      final expectedMap = {
        "id": tCharactersModel.id,
        "name": tCharactersModel.name,
        "description": tCharactersModel.description,
        "thumbnail": {
          "path": tThumbnailModel.path,
          "extension": tThumbnailModel.extension,
        },
      };

      expect(result, expectedMap);
    });
  });
}
