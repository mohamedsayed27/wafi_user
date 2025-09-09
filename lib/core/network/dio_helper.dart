import 'package:dio/dio.dart';
import '../cache_helper/cache_keys.dart';
import '../cache_helper/shared_pref_methods.dart';
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
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (CacheHelper.getData(key: CacheKeys.token) != null)
        "Authorization": "${CacheHelper.getData(key: CacheKeys.token)}",
      'Accept': 'text/plain',
      "Accept-Language": "en",
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  Future<Response> postData({
    required String url,
    dynamic query,
    dynamic data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (CacheHelper.getData(key: CacheKeys.token) != null)
        "Authorization": "${CacheHelper.getData(key: CacheKeys.token)}",
      'Accept': 'text/plain',
      "Accept-Language": "en",
    };
    return await dio.post(url, queryParameters: query, data: data);

    // return ;
  }

  Future<Response> deleteData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (CacheHelper.getData(key: CacheKeys.token) != null)
        "Authorization": "${CacheHelper.getData(key: CacheKeys.token)}",
      'Accept': 'text/plain',
      "Accept-Language": "en",
    };
    return await dio.delete(url, queryParameters: query, data: data);
  }

  Future<Response> putData({
    required String url,
    dynamic query,
    dynamic data,
    String lang = 'en',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      if (CacheHelper.getData(key: CacheKeys.token) != null)
        "Authorization": "${CacheHelper.getData(key: CacheKeys.token)}",
      'Accept': 'text/plain',
      "Accept-Language": "en",
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
