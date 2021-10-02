import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';

class CharacterTile extends StatelessWidget {
  final Character character;

  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urlImage =
        """${character.thumbnail.path}/standard_fantastic.${character.thumbnail.extension}""";

    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12, top: 10),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6.5,
                  width: MediaQuery.of(context).size.height / 6.5,
                  child: CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: urlImage,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        character.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      _handlingDescription(),
                      maxLines: 4,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _handlingDescription() {
    if (character.description.isEmpty) {
      return "Without description";
    } else if (character.description.length > 100) {
      return "${character.description.substring(0, 101)}...";
    } else {
      return character.description;
    }
  }
}
