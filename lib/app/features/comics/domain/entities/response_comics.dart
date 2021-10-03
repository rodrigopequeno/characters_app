import 'comic.dart';

class ResponseComics {
  final bool haveMore;
  final List<Comic> comics;

  ResponseComics({
    required this.haveMore,
    required this.comics,
  });
}
