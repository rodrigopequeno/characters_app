import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BlendMode? colorBlendMode;
  final Widget? defaultWidget;
  final Function? callbackError;

  const ImageNetworkWidget({
    Key? key,
    this.image,
    this.width,
    this.height,
    this.fit,
    this.colorBlendMode,
    this.defaultWidget,
    this.callbackError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image == null
        ? defaultWidget ??
            Icon(
              Icons.photo,
              size: 50,
              color: Theme.of(context).primaryColor,
            )
        : CachedNetworkImage(
            imageUrl: image!,
            cacheKey: image,
            fadeInDuration: const Duration(milliseconds: 200),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) {
              callbackError?.call();

              return Icon(
                Icons.error,
                size: 50,
                color: Colors.red[900],
              );
            },
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
            colorBlendMode: colorBlendMode,
          );
  }
}
