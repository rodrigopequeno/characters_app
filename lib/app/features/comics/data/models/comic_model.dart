import 'package:flutter/foundation.dart';

import '../../../../core/models/image_model.dart';
import '../../domain/entities/comic.dart';

class ComicModel extends Comic {
  ComicModel({
    required int id,
    required String title,
    required String variantDescription,
    required String description,
    required ImageModel thumbnail,
    required List<ImageModel> images,
  }) : super(
          id: id,
          title: title,
          variantDescription: variantDescription,
          description: description,
          thumbnail: thumbnail,
          images: images,
        );

  factory ComicModel.fromMap(Map<String, dynamic> map) {
    return ComicModel(
      id: (map['id'] ?? "") as int,
      title: (map['title'] ?? "") as String,
      variantDescription: (map['variantDescription'] ?? "") as String,
      description: (map['description'] ?? "") as String,
      thumbnail: ImageModel.fromMap(map['thumbnail'] as Map<String, dynamic>),
      images: List<ImageModel>.from(
        map['images']?.map((x) => ImageModel.fromMap(x as Map<String, dynamic>))
            as Iterable,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComicModel &&
        other.id == id &&
        other.title == title &&
        other.variantDescription == variantDescription &&
        other.description == description &&
        other.thumbnail == thumbnail &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        variantDescription.hashCode ^
        description.hashCode ^
        thumbnail.hashCode ^
        images.hashCode;
  }
}
