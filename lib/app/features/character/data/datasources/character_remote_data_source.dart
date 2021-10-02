import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service.dart';
import '../models/character_model.dart';
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
    int _offset;

    if (_responseCharacterModel == null && offset == null) {
      _offset = 0;
    } else if (offset == null && next) {
      _offset = _responseCharacterModel!.nextOffset;
    } else {
      _offset = offset ?? 0;
    }

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
}
