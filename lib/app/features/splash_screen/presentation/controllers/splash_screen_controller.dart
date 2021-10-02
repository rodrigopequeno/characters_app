import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../character/character_module.dart';
import '../../../character/presentation/pages/characters_page.dart';

part 'splash_screen_controller.g.dart';

class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  ReactionDisposer? disposer;

  void initialize() {
    disposer = autorun((_) {
      Future.delayed(const Duration(seconds: 4)).then(
        (v) => Modular.to.navigate(
          CharacterModule.routerName + CharactersPage.routerName,
        ),
      );
    });
  }

  void dispose() {
    disposer?.reaction.dispose();
  }
}
