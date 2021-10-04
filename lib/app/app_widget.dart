import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/design_system/theme.dart';
import 'features/splash_screen/presentation/pages/splash_screen_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Characters App',
      theme: ThemeSystem.get,
      initialRoute: SplashScreenPage.routerName,
    ).modular();
  }
}
