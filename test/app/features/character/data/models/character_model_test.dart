import 'dart:convert';

import 'package:characters_app/app/features/character/data/models/character_model.dart';
import 'package:characters_app/app/features/character/data/models/comic_model.dart';
import 'package:characters_app/app/features/character/data/models/comics_model.dart';
import 'package:characters_app/app/features/character/data/models/thumbnail_model.dart';
import 'package:characters_app/app/features/character/domain/entities/character.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
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
  final tCharactersModel = CharacterModel(
    id: 1011334,
    name: "3-D Man",
    description: "Test",
    comicsModel: tComicsModel,
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
        "comics": {
          "available": tComicsModel.available,
          "collectionURI": tComicsModel.collectionURI,
          "items": [
            {
              "resourceURI": tComicsModel.itemsModel[0].resourceURI,
              "name": tComicsModel.itemsModel[0].name,
            },
            {
              "resourceURI": tComicsModel.itemsModel[1].resourceURI,
              "name": tComicsModel.itemsModel[1].name,
            },
          ],
          "returned": tComicsModel.returned,
        },
      };

      expect(result, expectedMap);
    });
  });
}
