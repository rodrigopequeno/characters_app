import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

mixin Fonts {
  static const TextStyle profileTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    fontFamily: 'Gilroy-Heavy',
  );

  static const TextStyle homeTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    fontFamily: 'Gilroy-Heavy',
    color: ColorSystem.primaryDark,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    fontFamily: 'Gilroy-Heavy',
    color: Colors.white,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gilroy-Bold',
    color: ColorSystem.primaryRed,
  );

  static const TextStyle profileSubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Gilroy-Medium',
  );

  static const TextStyle homeSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Gilroy-Semibold',
    color: ColorSystem.primaryGrey,
  );

  static const TextStyle description = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Gilroy-Medium',
    color: ColorSystem.primaryWhite,
  );

  static const TextStyle characteristics = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Gilroy-Medium',
    color: ColorSystem.primaryWhite,
  );

  static const TextStyle ability = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Gilroy-Regular',
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: 'Gilroy-Medium',
    color: Colors.white,
  );

  static TextTheme get textTheme => const TextTheme(
        headline1: profileTitle,
        headline2: homeTitle,
        headline3: cardTitle,
        headline4: sectionTitle,
        headline5: profileSubtitle,
        headline6: homeSubtitle,
        subtitle1: description,
        subtitle2: characteristics,
        bodyText1: ability,
        bodyText2: cardSubtitle,
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      );
}
