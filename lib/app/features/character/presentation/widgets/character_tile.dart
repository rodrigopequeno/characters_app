import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/design_system/gradient.dart';
import '../../../../core/widgets/image_network/image_network_widget.dart';
import '../../domain/entities/character.dart';
import '../character_info_module.dart';

class CharacterTile extends StatelessWidget {
  final Character character;

  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          ".${CharacterInfoModule.routerName}/${character.id}",
          arguments: character,
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: [
            Positioned.fill(
              child: ImageNetworkWidget(
                image: character.thumbnail.urlFullSize,
                colorBlendMode: BlendMode.multiply,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: GradientSystem.gradientDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 20, right: 16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        character.name,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
