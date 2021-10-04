import '../../../../core/error/exceptions.dart';
import '../../../../core/service/service.dart';
import '../models/response_comics_model.dart';

abstract class ComicsRemoteDataSource {
  Future<ResponseComicsModel> getComics({
    required int characterId,
    int? offset,
    bool next = false,
  });
}

class ComicsRemoteDataSourceImpl implements ComicsRemoteDataSource {
  final Service service;

  ResponseComicsModel? _responseComicsModel;

  ComicsRemoteDataSourceImpl({required this.service});

  @override
  Future<ResponseComicsModel> getComics({
    required int characterId,
    int? offset,
    bool next = false,
  }) async {
    final _offset = _isNextPage(offset, next);

    try {
      final response = await service.get(
        '/characters/$characterId/comics',
        queryParameters: {
          "offset": _offset,
        },
      );
      if (response.statusCode == 200) {
        return _responseComicsModel = ResponseComicsModel.fromMap(
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
    if (_responseComicsModel == null && offset == null) {
      return 0;
    } else if (_responseComicsModel != null && offset == null && next) {
      return _responseComicsModel!.nextOffset;
    } else {
      return offset ?? 0;
    }
  }
}
