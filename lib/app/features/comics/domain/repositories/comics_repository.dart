import 'package:dartz/dartz.dart';

import '../../../../core/entities/response_data.dart';
import '../../../../core/error/failure.dart';
import '../entities/comic.dart';

abstract class ComicsRepository {
  Future<Either<Failure, ResponseData<Comic>>> getComics({
    required int characterId,
    int? offset,
    bool next = false,
  });
}
