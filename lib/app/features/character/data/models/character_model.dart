import '../../../../core/models/image_model.dart';
import '../../domain/entities/character.dart';

class CharacterModel extends Character {
  final ImageModel thumbnailModel;

  CharacterModel({
    required int id,
    required String name,
    required String description,
    required this.thumbnailModel,
  }) : super(
          id: id,
          description: description,
          name: name,
          thumbnail: thumbnailModel,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnailModel.toMap(),
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: (map['name'] ?? "") as String,
      description: (map['description'] ?? "") as String,
      thumbnailModel:
          ImageModel.fromMap(map['thumbnail'] as Map<String, dynamic>),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        thumbnail.hashCode;
  }
}
