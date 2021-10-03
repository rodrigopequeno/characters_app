import 'package:flutter/material.dart';

import '../../../../core/design_system/colors.dart';
import '../../../../core/design_system/icons.dart';

enum Characteristics {
  age,
  height,
  weight,
  universe,
}

extension CharacteristicsExtension on Characteristics {
  Widget get icon {
    switch (this) {
      case Characteristics.age:
        return IconsSystem.age(color: ColorSystem.primaryWhite);
      case Characteristics.height:
        return IconsSystem.height(color: ColorSystem.primaryWhite);
      case Characteristics.weight:
        return IconsSystem.weight(color: ColorSystem.primaryWhite);
      case Characteristics.universe:
        return IconsSystem.universe(color: ColorSystem.primaryWhite);
    }
  }

  String valueFormatted(double value) {
    switch (this) {
      case Characteristics.age:
        return "${value.toInt()} anos";
      case Characteristics.height:
        return "${value.toStringAsFixed(2)}m";
      case Characteristics.weight:
        return "${value.toStringAsFixed(1)}kg";
      case Characteristics.universe:
        return "Terra ${value.toInt()}";
    }
  }
}
