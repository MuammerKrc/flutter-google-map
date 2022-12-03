import 'package:dio/dio.dart';

class baseService {
  static const String _baseUri = "https://fluttertr-ead5c.firebaseio.com/";
  Dio getDio() {
    Dio dio = Dio(BaseOptions(baseUrl: _baseUri));
    return dio;
  }
}
