import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../utils/constants.dart';

abstract class GenerateHash {
  String call(String _timestamp);
  String get timestamp;
}

class GenerateHashImpl implements GenerateHash {
  final Hash md5;

  GenerateHashImpl({required this.md5});

  @override
  String call(String _timestamp) {
    return md5.convert(utf8.encode(_timestamp + api + apiKey)).toString();
  }

  @override
  String get timestamp => DateTime.now().toString();
}
