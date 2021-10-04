import 'package:characters_app/app/core/entities/image.dart';
import 'package:flutter_test/flutter_test.dart';

/// Documentation: https://developer.marvel.com/documentation/images
void main() {
  group(
    "urls",
    () {
      final tImage = Image(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215",
        extension: "jpg",
      );
      test(
        'should return the url of the image standard (square) aspect ratio 250x250px',
        () {
          const tUrlStandardFantastic =
              "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215/standard_fantastic.jpg";
          expect(tUrlStandardFantastic, tImage.urlStandardFantastic);
        },
      );
      test(
        'should return the url of the image full size image',
        () {
          const tUrlFullSize =
              "http://i.annihil.us/u/prod/marvel/i/mg/2/80/4c002f35c5215.jpg";
          expect(tUrlFullSize, tImage.urlFullSize);
        },
      );
    },
  );
}
