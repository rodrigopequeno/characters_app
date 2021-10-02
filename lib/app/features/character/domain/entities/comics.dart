import 'comic.dart';

class Comics {
  final int available;
  final String collectionURI;
  final List<Comic> items;
  final int returned;

  Comics({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });
}
