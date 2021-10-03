import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/widgets/loading_indicator/loading_indicator_widget.dart';
import '../controllers/comics_controller.dart';
import 'comic_tile.dart';

class ComicsWidget extends StatelessWidget {
  final double height;
  final ComicsController _controller;
  const ComicsWidget({
    Key? key,
    required ComicsController controller,
    this.height = 300,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (_) {
        if (_controller.objectsLoading) {
          return const LoadingIndicatorWidget();
        } else if (_controller.objectsError.isNotEmpty) {
          return Center(
            child: Text(_controller.objectsError),
          );
        } else if (_controller.comics.isEmpty) {
          return const Center(
            child: Text("No comics found"),
          );
        }
        final comics = _controller.comics;

        return ListView.builder(
          itemCount: comics.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            if (index < comics.length) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 153,
                  height: 230,
                  child: ComicTile(
                    comic: comics[index],
                  ),
                ),
              );
            } else if (!_controller.haveNext) {
              return Container(
                height: 30,
              );
            }
            _controller.loadNextComics();

            return const SizedBox(
              height: 150,
              child: LoadingIndicatorWidget(),
            );
          },
        );
      },
    );
  }
}
