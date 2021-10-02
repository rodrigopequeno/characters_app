import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/response_character.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  NetworkInfo networkInfo;
  CharacterRemoteDataSource characterRemoteDataSource;

  CharacterRepositoryImpl({
    required this.networkInfo,
    required this.characterRemoteDataSource,
  });

  @override
  Future<Either<Failure, ResponseCharacter>> getCharacters({
    int? offset,
    bool next = false,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await characterRemoteDataSource.getCharacters(
          offset: offset,
          next: next,
        );

        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
