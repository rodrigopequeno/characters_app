import 'package:flutter/material.dart';

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
        title: const Text("Info"),
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
              "Quadrinhos:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: character.comics.returned,
                itemBuilder: (_, index) {
                  final comics = character.comics.items[index];

                  return ListTile(
                    title: Text(
                      comics.name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
