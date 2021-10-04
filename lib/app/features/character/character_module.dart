import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/character_remote_data_source.dart';
import 'data/repositories/character_repository_impl.dart';
import 'domain/repositories/character_repository.dart';
import 'domain/usecases/get_characters.dart';
import 'presentation/character_info_module.dart';
import 'presentation/controllers/characters_controller.dart';
import 'presentation/pages/characters_page.dart';

class CharacterModule extends Module {
  static const String routerName = '/character';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton<CharacterRemoteDataSource>(
      (i) => CharacterRemoteDataSourceImpl(
        service: i.get(),
      ),
    ),
    Bind.lazySingleton<CharacterRepository>(
      (i) => CharacterRepositoryImpl(
        characterRemoteDataSource: i.get(),
        networkInfo: i.get(),
      ),
    ),
    Bind.lazySingleton(
      (i) => GetCharacters(i.get()),
    ),
    Bind.lazySingleton(
      (i) => CharactersController(getCharacters: i.get()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      CharactersPage.routerName,
      child: (_, args) => const CharactersPage(),
    ),
    ModuleRoute(
      CharacterInfoModule.routerName,
      module: CharacterInfoModule(),
    ),
  ];
}
