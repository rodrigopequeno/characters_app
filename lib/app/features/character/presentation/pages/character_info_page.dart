import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../comics/presentation/controllers/comics_controller.dart';
import '../../../comics/presentation/widgets/comics_widget.dart';
import '../../domain/entities/character.dart';
import '../widgets/character_tile.dart';

class CharacterInfoPage extends StatelessWidget {
  static const routerName = "/info";
  final Character character;
  const CharacterInfoPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CharacterTile(
              character: character,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Comics:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ComicsWidget(
              controller: ComicsController(
                characterId: character.id,
                getComics: Modular.get(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
