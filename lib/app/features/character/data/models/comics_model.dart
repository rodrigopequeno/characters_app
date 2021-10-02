import 'package:flutter/foundation.dart';

import '../../domain/entities/comics.dart';
import 'comic_model.dart';

class ComicsModel extends Comics {
  final List<ComicModel> itemsModel;

  ComicsModel({
    required int available,
    required String collectionURI,
    required this.itemsModel,
    required int returned,
  }) : super(
          available: available,
          collectionURI: collectionURI,
          items: itemsModel,
          returned: returned,
        );

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'items': itemsModel.map((x) => x.toMap()).toList(),
      'returned': returned,
    };
  }

  factory ComicsModel.fromMap(Map<String, dynamic> map) {
    return ComicsModel(
      available: map['available'] as int,
      collectionURI: map['collectionURI'] as String,
      itemsModel: List<ComicModel>.from(
        map['items']?.map((x) => ComicModel.fromMap(x as Map<String, dynamic>))
            as Iterable,
      ),
      returned: map['returned'] as int,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComicsModel &&
        other.available == available &&
        other.collectionURI == collectionURI &&
        listEquals(other.items, items) &&
        other.returned == returned;
  }

  @override
  int get hashCode {
    return available.hashCode ^
        collectionURI.hashCode ^
        items.hashCode ^
        returned.hashCode;
  }
}
