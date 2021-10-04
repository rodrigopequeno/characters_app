import '../entities/image.dart';

class ImageModel extends Image {
  ImageModel({
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

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      path: (map['path'] ?? "") as String,
      extension: (map['extension'] ?? "") as String,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageModel &&
        other.path == path &&
        other.extension == extension;
  }

  @override
  int get hashCode => path.hashCode ^ extension.hashCode;
}
