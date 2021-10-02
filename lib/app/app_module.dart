import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/generate_hash/generate_hash.dart';
import 'core/http_client/http_client.dart';
import 'core/http_client/interceptors/parameter_interceptor.dart';
import 'core/service/service.dart';
import 'features/character/character_module.dart';
import 'features/splash_screen/presentation/controllers/splash_screen_controller.dart';
import 'features/splash_screen/presentation/pages/splash_screen_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<Hash>(
      (i) => md5,
    ),
    Bind.lazySingleton<GenerateHash>(
      (i) => GenerateHashImpl(md5: i.get()),
    ),
    Bind.lazySingleton<Dio>(
      (i) {
        final httpClient = HttpClient();
        httpClient.interceptors
            .add(ParameterInterceptors(generateHash: i.get()));

        return httpClient;
      },
    ),
    Bind.lazySingleton<Service>(
      (i) => ServiceImpl(client: i.get()),
    ),
    Bind.lazySingleton((i) => SplashScreenController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      SplashScreenPage.routerName,
      child: (_, args) => const SplashScreenPage(),
    ),
    ModuleRoute(CharacterModule.routerName, module: CharacterModule()),
  ];
}
