import 'comics.dart';
import 'thumbnail.dart';

class Character {
  final int id;
  final String name;
  final String description;
  final Thumbnail thumbnail;
  final Comics comics;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
  });
}
