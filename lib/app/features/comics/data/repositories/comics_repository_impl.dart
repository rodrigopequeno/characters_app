import 'package:dartz/dartz.dart';

import '../../../../core/entities/response_data.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/comic.dart';
import '../../domain/repositories/comics_repository.dart';
import '../datasources/comics_remote_data_source.dart';

class ComicsRepositoryImpl implements ComicsRepository {
  NetworkInfo networkInfo;
  ComicsRemoteDataSource comicsRemoteDataSource;

  ComicsRepositoryImpl({
    required this.networkInfo,
    required this.comicsRemoteDataSource,
  });

  @override
  Future<Either<Failure, ResponseData<Comic>>> getComics({
    required int characterId,
    int? offset,
    bool next = false,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final comics = await comicsRemoteDataSource.getComics(
          characterId: characterId,
          offset: offset,
          next: next,
        );

        return Right(comics);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
