import 'dart:convert';

import 'package:characters_app/app/core/models/image_model.dart';
import 'package:characters_app/app/features/comics/data/models/comic_model.dart';
import 'package:characters_app/app/features/comics/domain/entities/comic.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tThumbnailModel = ImageModel(
    path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/4bc64020a4ccc",
    extension: "jpg",
  );
  final tImagesModel = [
    ImageModel(
      path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/4bc64020a4ccc",
      extension: "jpg",
    ),
  ];
  final tComicsModel = ComicModel(
    id: 1886,
    description:
        """The spectacular sequel to last year's OFFICIAL HANDBOOK OF THE MARVEL UNIVERSE: SPIDER-MAN 2004, this Official Handbook contains in-depth bios on more than 30 of the wisecracking web-slinger's closest allies and most infamous enemies - including the Stacy Twins, fresh from the pages of AMAZING SPIDER-MAN, and Toxin, in time for this month's TOXIN #1! Plus: An all-new cover by superstar artist Tom Raney, digitally painted by Morry Hollowell.\r<br>48 PGS./Marvel PSR ...\$3.99\r<br>""",
    imagesModel: tImagesModel,
    thumbnailModel: tThumbnailModel,
    title: "Official Handbook of the Marvel Universe (2004) #12 (SPIDER-MAN)",
    variantDescription: "SPIDER-MAN",
  );

  test('should be a subclass of Comic entity', () async {
    expect(tComicsModel, isA<Comic>());
  });

  group("fromMap", () {
    test('should return a valid model when from JSON', () async {
      final jsonMap =
          json.decode(fixture("comic.json")) as Map<String, dynamic>;

      final result = ComicModel.fromMap(jsonMap);

      expect(result, tComicsModel);
    });
  });

  group("toJson", () {
    test('should return a JSON map containing the proper data', () async {
      final result = tComicsModel.toMap();

      final expectedMap = {
        'id': tComicsModel.id,
        'title': tComicsModel.title,
        'variantDescription': tComicsModel.variantDescription,
        'description': tComicsModel.description,
        'thumbnail': {
          'path': tThumbnailModel.path,
          'extension': tThumbnailModel.extension,
        },
        'images': [
          {
            'path': tThumbnailModel.path,
            'extension': tThumbnailModel.extension,
          },
        ],
      };

      expect(result, expectedMap);
    });
  });

  group("hashCode", () {
    test('should return hash code based on all attributes', () async {
      final result = tComicsModel.hashCode;

      final expected = tComicsModel.id.hashCode ^
          tComicsModel.title.hashCode ^
          tComicsModel.variantDescription.hashCode ^
          tComicsModel.description.hashCode ^
          tComicsModel.thumbnail.hashCode ^
          tComicsModel.images.hashCode;

      expect(result, expected);
    });
  });
}
