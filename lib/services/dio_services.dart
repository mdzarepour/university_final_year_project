import 'package:dio/dio.dart';

class DioServices {
  final Dio _dio = Dio(); // Use a single instance of Dio

  DioServices() {
    _dio.options.headers['Content-Type'] = 'application/json'; // Corrected header key
  }

  Future<Response<dynamic>> getMethod(String url) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      return response;
    } on DioError catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    } catch (e) {
      // Handle any other types of exceptions
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
