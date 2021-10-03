import 'package:flutter_modular/flutter_modular.dart';

import '../comics/data/repositories/comics_repository_impl.dart';
import '../comics/domain/repositories/comics_repository.dart';
import '../comics/domain/usecases/get_comics.dart';
import 'data/datasources/comics_remote_data_source.dart';

class ComicsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ComicsRemoteDataSource>(
      (i) => ComicsRemoteDataSourceImpl(
        service: i.get(),
      ),
      export: true,
    ),
    Bind.lazySingleton<ComicsRepository>(
      (i) => ComicsRepositoryImpl(
        comicsRemoteDataSource: i.get(),
        networkInfo: i.get(),
      ),
      export: true,
    ),
    Bind.lazySingleton(
      (i) => GetComics(i.get()),
      export: true,
    ),
  ];
}
