import 'package:dio/dio.dart';

class baseService {
  static String _baseUri = "https://hwafire-4cae8.firebaseio.com";
  Dio _getDio() {
    Dio dio = Dio(BaseOptions(baseUrl: _baseUri));
    return dio;
  }
}
