import 'package:flutter/material.dart';

import '../../../../core/design_system/gradient.dart';
import '../../../../core/design_system/icons.dart';

enum Categories {
  hero,
  villain,
  antihero,
  alien,
  human,
}

extension CategoriesExtension on Categories {
  Widget get icon {
    switch (this) {
      case Categories.hero:
        return IconsSystem.hero(color: Colors.white);
      case Categories.villain:
        return IconsSystem.villain(color: Colors.white);
      case Categories.antihero:
        return IconsSystem.antihero(color: Colors.white);
      case Categories.alien:
        return IconsSystem.alien(color: Colors.white);
      case Categories.human:
        return IconsSystem.human(color: Colors.white);
    }
  }

  Gradient get gradient {
    switch (this) {
      case Categories.hero:
        return GradientSystem.gradientBlue;
      case Categories.villain:
        return GradientSystem.gradientRed;
      case Categories.antihero:
        return GradientSystem.gradientPurple;
      case Categories.alien:
        return GradientSystem.gradientGreen;
      case Categories.human:
        return GradientSystem.gradientPink;
    }
  }
}
