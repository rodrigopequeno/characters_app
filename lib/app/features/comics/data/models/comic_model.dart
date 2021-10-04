import 'package:flutter/foundation.dart';

import '../../../../core/models/image_model.dart';
import '../../domain/entities/comic.dart';

class ComicModel extends Comic {
  final ImageModel thumbnailModel;
  final List<ImageModel> imagesModel;

  ComicModel({
    required int id,
    required String title,
    required String variantDescription,
    required String description,
    required this.thumbnailModel,
    required this.imagesModel,
  }) : super(
          id: id,
          title: title,
          variantDescription: variantDescription,
          description: description,
          thumbnail: thumbnailModel,
          images: imagesModel,
        );

  factory ComicModel.fromMap(Map<String, dynamic> map) {
    return ComicModel(
      id: (map['id'] ?? "") as int,
      title: (map['title'] ?? "") as String,
      variantDescription: (map['variantDescription'] ?? "") as String,
      description: (map['description'] ?? "") as String,
      thumbnailModel:
          ImageModel.fromMap(map['thumbnail'] as Map<String, dynamic>),
      imagesModel: List<ImageModel>.from(
        map['images']?.map((x) => ImageModel.fromMap(x as Map<String, dynamic>))
            as Iterable,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'variantDescription': variantDescription,
      'description': description,
      'thumbnail': thumbnailModel.toMap(),
      'images': imagesModel.map((x) => x.toMap()).toList(),
    };
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
