import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service.dart';

import '../models/response_character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<ResponseCharacterModel> getCharacters({
    int? offset,
    bool next = false,
  });
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Service service;

  ResponseCharacterModel? _responseCharacterModel;

  CharacterRemoteDataSourceImpl({required this.service});

  @override
  Future<ResponseCharacterModel> getCharacters({
    int? offset,
    bool next = false,
  }) async {
    final _offset = _isNextPage(offset, next);

    try {
      final response = await service.get(
        '/characters',
        queryParameters: {
          "offset": _offset,
        },
      );
      if (response.statusCode == 200) {
        return _responseCharacterModel = ResponseCharacterModel.fromMap(
          response.data["data"] as Map<String, dynamic>,
        );
      } else {
        throw ServerException();
      }
    } on ServiceException {
      throw ServerException();
    }
  }

  int _isNextPage(int? offset, bool next) {
    if (_responseCharacterModel == null && offset == null) {
      return 0;
    } else if (_responseCharacterModel != null && offset == null && next) {
      return _responseCharacterModel!.nextOffset;
    } else {
      return offset ?? 0;
    }
  }
}
