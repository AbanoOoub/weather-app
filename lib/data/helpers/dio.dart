import 'package:dio/dio.dart';
import '../constants/strings.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      receiveDataWhenStatusError: true,
      followRedirects: false,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        "Accept": "application/json",
        "X-RapidAPI-Key":"f3058f448emsh41f17f271fc4725p16cb82jsn3fdf60d411f2",
        "X-RapidAPI-Host":"weather-by-api-ninjas.p.rapidapi.com"
      },
      validateStatus: (_) => true,
    ));
  }

  static Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? query, String? token}) async {
    token != null
        ? dio.options.headers = {
      'Authorization': 'Bearer $token',
    } : '';
    return await dio.get(endPoint, queryParameters: query);
  }
}