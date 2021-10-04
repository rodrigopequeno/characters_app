class Image {
  final String path;
  final String extension;

  String get urlStandardFantastic => """$path/standard_fantastic.$extension""";
  String get urlFullSize => """$path.$extension""";

  Image({
    required this.path,
    required this.extension,
  });
}
