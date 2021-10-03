import 'package:flutter_modular/flutter_modular.dart';

import '../../comics/comics_module.dart';
import '../domain/entities/character.dart';
import 'pages/character_info_page.dart';

class CharacterInfoModule extends Module {
  static const routerName = "/info";

  @override
  List<Module> get imports => [
        ComicsModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      CharacterInfoPage.routerName,
      child: (_, args) => CharacterInfoPage(
        character: args.data as Character,
      ),
    ),
  ];
}
