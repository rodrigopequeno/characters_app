import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/comics_controller.dart';
import 'comic_tile.dart';

class ComicsWidget extends StatelessWidget {
  final double height;
  final ComicsController _controller;
  ComicsWidget({
    Key? key,
    required ComicsController controller,
    this.height = 300,
  })  : _controller = controller,
        super(key: key) {
    _controller.loadComics();
  }

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
        if (_controller.comicsLoading) {
          return _buildLoading();
        } else if (_controller.comicsError.isNotEmpty) {
          return Center(
            child: Text(_controller.comicsError),
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
              return SizedBox(
                width: 250,
                child: ComicTile(
                  comic: comics[index],
                ),
              );
            } else if (!_controller.haveNext) {
              return Container(
                height: 30,
              );
            }
            _controller.loadNextComics();

            return SizedBox(
              height: 150,
              child: _buildLoading(),
            );
          },
        );
      },
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
