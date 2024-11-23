import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_services;

class DioServices {
  Dio dio = Dio();

  Future<Response<dynamic>> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    try {
      final response = await dio.get(
        url,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    try {
      dio.options.headers['content-Type'] = 'application/json';

      return await dio
          .post(url,
              data: dio_services.FormData.fromMap(map),
              options: Options(responseType: ResponseType.json, method: 'POST'))
          .then(
        (value) {
          return value;
        },
      );
    } catch (ex) {
      ('dio post method vale error ==== >$ex');
    }
  }
}
