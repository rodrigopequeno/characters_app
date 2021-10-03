import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/design_system/colors.dart';
import '../../../../core/design_system/gradient.dart';
import '../../../../core/widgets/image_network/image_network_widget.dart';
import '../../../../core/widgets/spacers/spacers.dart';
import '../../../comics/presentation/controllers/comics_controller.dart';
import '../../../comics/presentation/widgets/comics_widget.dart';
import '../../domain/entities/character.dart';
import '../../domain/entities/characteristics.dart';

class CharacterInfoPage extends StatelessWidget {
  static const routerName = "/:characterId";
  final Character character;
  final ComicsController comicsController = Modular.get();
  CharacterInfoPage({Key? key, required this.character}) : super(key: key) {
    comicsController.loadComics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorSystem.primaryBlack,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    const paddingAll = 24.0;
    final positionName = MediaQuery.of(context).size.height * 0.4;

    final total = _getSizePage();

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: total,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.55,
            child: ImageNetworkWidget(
              image: character.thumbnail.urlFullSize,
              colorBlendMode: BlendMode.multiply,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Container(
              decoration: const BoxDecoration(
                gradient: GradientSystem.gradientBlack,
              ),
            ),
          ),
          Positioned(
            top: positionName,
            left: paddingAll,
            right: paddingAll,
            child: _buildInformation(context),
          ),
        ],
      ),
    );
  }

  double _getSizePage() {
    const textPerLineName = 38;
    const heightPerLineName = 23;
    final heightName = character.name.length > textPerLineName
        ? heightPerLineName
        : heightPerLineName * 2;

    const standardSize = 830;
    const textPerLineDescription = 50;
    const heightPerLineDescription = 16;
    final heightDescription = character.description.isNotEmpty
        ? (character.description.length / textPerLineDescription) *
            heightPerLineDescription
        : heightPerLineDescription;

    final total = (heightName + heightDescription + standardSize).toDouble();

    return total;
  }

  Widget _buildInformation(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            character.name,
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.headline3,
          ),
          const SpacerHeight(48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Characteristics.values.map(
              (e) {
                final value = _valueCharacteristics(e);

                return Column(
                  children: [
                    e.icon,
                    const SpacerHeight(14),
                    Text(
                      e.valueFormatted(value),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                );
              },
            ).toList(),
          ),
          const SpacerHeight(24),
          Text(
            _handlingDescription,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SpacerHeight(32),
          Text(
            "Comics",
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: ColorSystem.primaryWhite),
          ),
          const SpacerHeight(24),
          ComicsWidget(
            controller: comicsController,
          ),
        ],
      ),
    );
  }

  String get _handlingDescription {
    return character.description.isEmpty
        ? "No description"
        : character.description;
  }

  double _valueCharacteristics(Characteristics characteristics) {
    switch (characteristics) {
      case Characteristics.age:
        return Random().nextInt(100).toDouble();
      case Characteristics.height:
        return Random().nextInt(250) * Random().nextDouble();
      case Characteristics.weight:
        return Random().nextInt(150) * Random().nextDouble();
      case Characteristics.universe:
        return Random().nextInt(2000).toDouble();
    }
  }
}
