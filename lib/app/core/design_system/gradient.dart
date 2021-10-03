import 'package:flutter/material.dart';

mixin GradientSystem {
  static const gradientBlue = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff005BEA),
      Color(0xff00C6FB),
    ],
  );
  static const gradientRed = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffED1D24),
      Color(0xffED1F69),
    ],
  );
  static const gradientPurple = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffB224EF),
      Color(0xff7579FF),
    ],
  );
  static const gradientGreen = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff0BA360),
      Color(0xff3CBA92),
    ],
  );
  static const gradientPink = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFF7EB3),
      Color(0xffFF758C),
    ],
  );
  static const gradientBlack = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0xff000000),
    ],
    stops: [0.3, 0.75],
  );
  static const gradientDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0xff000000),
    ],
    stops: [0.4, 1],
  );

  static const gradientDarkWithBiggerStop = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0xff000000),
      Color(0xff000000),
    ],
    stops: [0.3, 0.75, 1],
  );
}
