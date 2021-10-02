import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_controller.g.dart';

class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  ReactionDisposer? disposer;

  void initialize() {
    disposer = autorun((_) {
      Future.delayed(const Duration(seconds: 4))
          .then((v) => debugPrint("Loaded"));
    });
  }

  void dispose() {
    disposer?.reaction.dispose();
  }
}
