import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/response_character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, ResponseCharacter>> getCharacters({
    int? offset,
    bool next = false,
  });
}
