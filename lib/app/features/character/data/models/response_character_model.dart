import '../../domain/entities/character.dart';
import '../../domain/entities/response_character.dart';
import 'character_model.dart';

class ResponseCharacterModel extends ResponseCharacter {
  final int offset;
  final int limit;
  final int total;
  final int count;

  ResponseCharacterModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required List<Character> characters,
  }) : super(
          characters: characters,
          haveMore: _hasNext(offset, count, total),
        );

  static bool _hasNext(int offset, int count, int total) =>
      (offset + count) < total;

  int get nextOffset => offset + count;

  factory ResponseCharacterModel.fromMap(Map<String, dynamic> map) {
    return ResponseCharacterModel(
      offset: map['offset'] as int,
      limit: map['limit'] as int,
      total: map['total'] as int,
      count: map['count'] as int,
      characters: List<CharacterModel>.from(
        map['results']
                ?.map((x) => CharacterModel.fromMap(x as Map<String, dynamic>))
            as Iterable,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseCharacterModel &&
        other.offset == offset &&
        other.limit == limit &&
        other.total == total &&
        other.count == count;
  }

  @override
  int get hashCode {
    return offset.hashCode ^ limit.hashCode ^ total.hashCode ^ count.hashCode;
  }
}
