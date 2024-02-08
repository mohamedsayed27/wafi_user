import 'package:dio/dio.dart';
import 'api_end_points.dart';

class DioHelper {
  static late Dio dio;

   static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

   Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? bearerToken,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': '',
      if (bearerToken != null) "Authorization": "Bearer $bearerToken",
      'Accept': 'text/plain',
    };
    return await dio.get(url, queryParameters: query,);
  }

   Future<Response> postData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': '',
      if (token != null) "Authorization": "Bearer $token",
      'Accept': 'text/plain',
    };
    return await dio.post(url, queryParameters: query, data: data);

    // return ;
  }

   Future<Response> deleteData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': '',
      if (token != null) "Authorization": "Bearer $token",
      'Accept': 'text/plain',
    };
    return await dio.delete(url, queryParameters: query, data: data);
  }

   Future<Response> putData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) "Authorization": "Bearer $token",
      'Accept': 'text/plain',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
