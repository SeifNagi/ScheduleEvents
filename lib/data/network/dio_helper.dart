import '../endpoints.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE',
    required Map<String, dynamic> query,
  }) async {
    dio.options = BaseOptions(
        headers: {'Content-Type': 'application/json', 'authorization': token});
    print(baseUrl);
    return await dio.get(baseUrl, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE',
    required Map<String, dynamic> dataTobody,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'authorization': token
    };
    return dio.post(baseUrl + url, data: dataTobody);
  }
}
