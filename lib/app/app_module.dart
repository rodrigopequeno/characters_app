import 'package:flutter_modular/flutter_modular.dart';

import 'features/splash_screen/presentation/controllers/splash_screen_controller.dart';
import 'features/splash_screen/presentation/pages/splash_screen_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashScreenController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      SplashScreenPage.routerName,
      child: (_, args) => const SplashScreenPage(),
    ),
  ];
}
