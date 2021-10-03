import '../../../../core/entities/image.dart';

class Comic {
  final int id;
  final String title;
  final String variantDescription;
  final String description;
  final Image thumbnail;
  final List<Image> images;

  Comic({
    required this.id,
    required this.title,
    required this.variantDescription,
    required this.description,
    required this.thumbnail,
    required this.images,
  });
}
