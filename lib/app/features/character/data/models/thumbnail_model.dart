import '../../domain/entities/thumbnail.dart';

class ThumbnailModel extends Thumbnail {
  ThumbnailModel({
    required String path,
    required String extension,
  }) : super(
          path: path,
          extension: extension,
        );

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'extension': extension,
    };
  }

  factory ThumbnailModel.fromMap(Map<String, dynamic> map) {
    return ThumbnailModel(
      path: map['path'] as String,
      extension: map['extension'] as String,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThumbnailModel &&
        other.path == path &&
        other.extension == extension;
  }

  @override
  int get hashCode => path.hashCode ^ extension.hashCode;
}
