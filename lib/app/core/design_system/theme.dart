import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

mixin ThemeSystem {
  static ThemeData get get {
    return ThemeData(
      primaryColor: ColorSystem.primaryDark,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: ColorSystem.primaryRed,
      ),
      backgroundColor: ColorSystem.primarySilver,
      textTheme: Fonts.textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorSystem.primarySilver,
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
