import 'character.dart';

class ResponseCharacter {
  final bool haveMore;
  final List<Character> characters;

  ResponseCharacter({
    required this.haveMore,
    required this.characters,
  });
}
