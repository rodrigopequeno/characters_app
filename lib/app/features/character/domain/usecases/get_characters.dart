import 'package:dartz/dartz.dart';

import '../../../../core/entities/response_data.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetCharacters
    implements UseCase<ResponseData<Character>, GetCharactersParams> {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure, ResponseData<Character>>> call(
    GetCharactersParams params,
  ) async {
    return repository.getCharacters(
      offset: params.offset,
      next: params.next,
    );
  }
}

class GetCharactersParams {
  int? offset;
  bool next;

  GetCharactersParams({
    this.offset,
    this.next = false,
  });
}
