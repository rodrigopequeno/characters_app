import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/comic.dart';

class ComicTile extends StatelessWidget {
  final Comic comic;

  const ComicTile({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12, top: 10),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: CachedNetworkImage(
                  imageUrl: comic.thumbnail.urlFullSize,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        comic.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 18,
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
    if (comic.description.isEmpty) {
      return "Without description";
    } else if (comic.description.length > 100) {
      return "${comic.description.substring(0, 101)}...";
    } else {
      return comic.description;
    }
  }
}
