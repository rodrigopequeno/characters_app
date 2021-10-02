import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/characters_controller.dart';
import '../widgets/character_tile.dart';

class CharactersPage extends StatefulWidget {
  static const routerName = "/";
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState
    extends ModularState<CharactersPage, CharactersController> {
  @override
  void initState() {
    controller.loadCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () => controller.loadCharacters(isRefresh: true),
      child: Observer(
        builder: (_) {
          if (controller.charactersLoading) {
            return _buildLoading();
          } else if (controller.charactersError.isNotEmpty) {
            return Center(
              child: Text(controller.charactersError),
            );
          }
          final characters = controller.characters;

          return ListView.builder(
            itemCount: characters.length + 1,
            itemBuilder: (context, index) {
              if (index < characters.length) {
                return CharacterTile(
                  character: characters[index],
                );
              } else if (!controller.haveNext) {
                return Container(
                  height: 30,
                );
              }
              controller.loadNextCharacters();

              return SizedBox(
                height: 150,
                child: _buildLoading(),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[700]!),
      ),
    );
  }
}
