import 'package:dartz/dartz.dart';

import '../../../../core/entities/response_data.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/comic.dart';
import '../repositories/comics_repository.dart';

class GetComics implements UseCase<ResponseData<Comic>, GetComicsParams> {
  final ComicsRepository repository;

  GetComics(this.repository);

  @override
  Future<Either<Failure, ResponseData<Comic>>> call(
    GetComicsParams params,
  ) async {
    return repository.getComics(
      characterId: params.characterId,
      offset: params.offset,
      next: params.next,
    );
  }
}

class GetComicsParams {
  int characterId;
  int? offset;
  bool next;

  GetComicsParams({
    required this.characterId,
    this.offset,
    this.next = false,
  });
}
