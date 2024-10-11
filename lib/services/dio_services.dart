import 'package:dio/dio.dart';

class DioServices {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';

    return await dio
        .get(url,
            options: Options(
              contentType: 'application/json',
              responseType: ResponseType.json,
              method: 'GET',
            ))
        .then(
      (value) {
        return value;
      },
    );
  }
}
