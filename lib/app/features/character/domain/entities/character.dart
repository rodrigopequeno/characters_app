import '../../../../core/entities/image.dart';

class Character {
  final int id;
  final String name;
  final String description;
  final Image thumbnail;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });
}
