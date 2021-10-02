import '../../domain/entities/comic.dart';

class ComicModel extends Comic {
  ComicModel({
    required String resourceURI,
    required String name,
  }) : super(
          name: name,
          resourceURI: resourceURI,
        );

  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }

  factory ComicModel.fromMap(Map<String, dynamic> map) {
    return ComicModel(
      resourceURI: map['resourceURI'] as String,
      name: map['name'] as String,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComicModel &&
        other.resourceURI == resourceURI &&
        other.name == name;
  }

  @override
  int get hashCode => resourceURI.hashCode ^ name.hashCode;
}
