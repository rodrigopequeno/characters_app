import 'package:flutter/material.dart';

import '../../../../core/widgets/spacers/spacers.dart';
import '../../domain/entities/categories.dart';
import 'circle_icon_widget.dart';

class HeaderCharacterPage extends StatelessWidget {
  const HeaderCharacterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Marvel Characters",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SpacerHeight(8),
        Text(
          "Choose your\ncharacter",
          style: Theme.of(context).textTheme.headline2,
        ),
        const SpacerHeight(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: Categories.values
              .map(
                (e) => CircleIconWidget(
                  gradient: e.gradient,
                  icon: e.icon,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
