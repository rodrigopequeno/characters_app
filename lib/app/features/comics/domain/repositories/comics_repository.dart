import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/response_comics.dart';

abstract class ComicsRepository {
  Future<Either<Failure, ResponseComics>> getComics({
    required int characterId,
    int? offset,
    bool next = false,
  });
}
