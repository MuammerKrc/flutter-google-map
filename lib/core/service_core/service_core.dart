import 'package:dio/dio.dart';

class baseService {
  static String _baseUri = "https://fluttertr-ead5c.firebaseio.com/";
  Dio getDio() {
    Dio dio = Dio(BaseOptions(baseUrl: _baseUri));
    return dio;
  }
}
