import '../../../../core/entities/response_data.dart';

import '../../domain/entities/comic.dart';
import 'comic_model.dart';

class ResponseComicsModel extends ResponseData<Comic> {
  final int offset;
  final int limit;
  final int total;
  final int count;

  ResponseComicsModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required List<Comic> comics,
  }) : super(
          result: comics,
          haveMore: _hasNext(offset, count, total),
        );

  static bool _hasNext(int offset, int count, int total) =>
      (offset + count) < total;

  int get nextOffset => offset + count;

  factory ResponseComicsModel.fromMap(Map<String, dynamic> map) {
    return ResponseComicsModel(
      offset: map['offset'] as int,
      limit: map['limit'] as int,
      total: map['total'] as int,
      count: map['count'] as int,
      comics: List<ComicModel>.from(
        map['results']
                ?.map((x) => ComicModel.fromMap(x as Map<String, dynamic>))
            as Iterable,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseComicsModel &&
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
