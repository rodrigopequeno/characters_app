import 'dart:convert';

import 'package:characters_app/app/core/models/image_model.dart';
import 'package:characters_app/app/features/comics/data/models/comic_model.dart';
import 'package:characters_app/app/features/comics/data/models/response_comics_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tThumbnailModel = ImageModel(
    path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
    extension: "jpg",
  );
  final tComicsModel = ComicModel(
    id: 1011334,
    description: "Comic 1 description",
    thumbnailModel: tThumbnailModel,
    imagesModel: [tThumbnailModel],
    title: "Comic 1",
    variantDescription: "Comic 1 variantDescription",
  );
  final tResponseComics = ResponseComicsModel(
    comics: List.generate(20, (index) => tComicsModel),
    count: 20,
    limit: 20,
    offset: 0,
    total: 123,
  );

  group("fromMap", () {
    test('should return a valid model when from JSON', () async {
      final jsonMap =
          json.decode(fixture("comics.json")) as Map<String, dynamic>;

      final result =
          ResponseComicsModel.fromMap(jsonMap['data'] as Map<String, dynamic>);

      expect(result, tResponseComics);
    });
  });

  group("nextOffset", () {
    test('should return offset value to bring more data', () async {
      final _nextOffsetExpected =
          tResponseComics.offset + tResponseComics.count;

      expect(tResponseComics.nextOffset, _nextOffsetExpected);
    });
  });

  group("hashCode", () {
    test('should return hash code based on all attributes', () async {
      final result = tResponseComics.hashCode;

      final expected = tResponseComics.offset.hashCode ^
          tResponseComics.limit.hashCode ^
          tResponseComics.total.hashCode ^
          tResponseComics.count.hashCode;

      expect(result, expected);
    });
  });
}
