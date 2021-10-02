import '../../domain/entities/character.dart';

import 'comics_model.dart';
import 'thumbnail_model.dart';

class CharacterModel extends Character {
  final ThumbnailModel thumbnailModel;
  final ComicsModel comicsModel;

  CharacterModel({
    required int id,
    required String name,
    required String description,
    required this.thumbnailModel,
    required this.comicsModel,
  }) : super(
          id: id,
          description: description,
          name: name,
          comics: comicsModel,
          thumbnail: thumbnailModel,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnailModel.toMap(),
      'comics': comicsModel.toMap(),
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnailModel:
          ThumbnailModel.fromMap(map['thumbnail'] as Map<String, dynamic>),
      comicsModel: ComicsModel.fromMap(map['comics'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'Character(id: $id, name: $name, description: $description, thumbnail: $thumbnail, comics: $comics)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.thumbnail == thumbnail &&
        other.comics == comics;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        thumbnail.hashCode ^
        comics.hashCode;
  }
}
