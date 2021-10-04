import 'package:dartz/dartz.dart';

import '../../../../core/entities/response_data.dart';
import '../../../../core/error/failure.dart';
import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, ResponseData<Character>>> getCharacters({
    int? offset,
    bool next = false,
  });
}
