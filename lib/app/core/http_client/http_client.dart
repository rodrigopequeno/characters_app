import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../utils/constants.dart';

const baseURL = "https://gateway.marvel.com:443/v1/public";

class HttpClient extends DioForNative {
  HttpClient()
      : super(
          BaseOptions(
            baseUrl: baseURL,
            queryParameters: {
              "apikey": apiKey,
            },
          ),
        );
}
