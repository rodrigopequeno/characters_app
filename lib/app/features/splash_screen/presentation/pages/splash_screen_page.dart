import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenPage extends StatefulWidget {
  static const routerName = "/splash-screen";
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState
    extends ModularState<SplashScreenPage, SplashScreenController> {
  ReactionDisposer? disposer;

  @override
  void initState() {
    controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF080229),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100, left: 50, right: 50),
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
