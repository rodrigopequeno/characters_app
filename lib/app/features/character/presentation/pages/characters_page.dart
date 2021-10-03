import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/design_system/icons.dart';
import '../../../../core/widgets/loading_indicator/loading_indicator_widget.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../controllers/characters_controller.dart';
import '../widgets/character_tile.dart';
import '../widgets/header_character_page.dart';

class CharactersPage extends StatefulWidget {
  static const routerName = "/";
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState
    extends ModularState<CharactersPage, CharactersController> {
  late ScrollController _scrollController;

  @override
  void initState() {
    controller.loadCharacters();
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      controller.loadNextCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: _showSnackBar,
        icon: IconsSystem.menu(width: 20),
      ),
      title: IconsSystem.logoMarvel(
        color: Theme.of(context).colorScheme.secondary,
      ),
      actions: [
        IconButton(
          onPressed: _showSnackBar,
          icon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  Future<void> _showSnackBar() async {
    if (controller.snackBarIsVisible) {
      return;
    }
    const duration = Duration(milliseconds: 1000);
    final snackBar = SnackBar(
      content: const Text('Recurso não está disponível!'),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      duration: duration,
    );
    controller.setSnackBarIsVisible(true);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    await Future.delayed(duration)
        .then((value) => controller.setSnackBarIsVisible(false));
  }

  Widget _buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.loadCharacters(isRefresh: true),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const HeaderCharacterPage(),
              const SpacerHeight(48),
              Row(
                children: [
                  Text(
                    "Characters",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              const SpacerHeight(16),
              Observer(
                builder: (_) {
                  if (controller.charactersLoading) {
                    return const LoadingIndicatorWidget();
                  } else if (controller.charactersError.isNotEmpty) {
                    return Center(
                      child: Text(controller.charactersError),
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      childAspectRatio: 7 / 11.5,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: controller.characters.length,
                    itemBuilder: _buildItems,
                  );
                },
              ),
              _buildNextLoading(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextLoading() {
    return Observer(
      builder: (_) {
        if (controller.charactersNextLoading) {
          return const SizedBox(height: 150, child: LoadingIndicatorWidget());
        } else if (controller.charactersNextError.isNotEmpty) {
          return Center(
            child: Text(controller.charactersNextError),
          );
        }

        return const SpacerHeight(150);
      },
    );
  }

  Widget _buildItems(BuildContext _, int index) {
    if (index < controller.characters.length) {
      return CharacterTile(
        character: controller.characters[index],
      );
    } else if (!controller.haveNext) {
      return Container(
        height: 30,
      );
    }

    return const SizedBox(
      height: 150,
      child: LoadingIndicatorWidget(),
    );
  }
}
