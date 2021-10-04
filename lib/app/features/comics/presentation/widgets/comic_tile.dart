import 'package:flutter/material.dart';

import '../../../../core/design_system/gradient.dart';
import '../../../../core/widgets/image_network/image_network_widget.dart';
import '../../domain/entities/comic.dart';

class ComicTile extends StatelessWidget {
  final Comic comic;

  const ComicTile({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Stack(
        children: [
          Positioned.fill(
            child: ImageNetworkWidget(
              image: comic.thumbnail.urlFullSize,
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
                      comic.title,
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
