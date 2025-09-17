import 'package:dio/dio.dart';
import 'package:polito_api_flutter/src/constants.dart';
import 'package:polito_api_flutter/src/models/request/login_request.dart';


class PolitoApi {
  final Dio _dio;

  PolitoApi({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl));

  Future<void> basicLogin(LoginRequest request) async {
    try {
      final data = await request.toJson();
      print("Login data: $data");

      final response = await _dio.post('/auth/login', data: data);

      if (response.statusCode == 200) {
        print("Login successful: ${response.data}");
      } else {
        print("Login failed with status: ${response.statusCode}");
        print("Server message: ${response.data}");
      }
    } on DioException catch (e) {
      print("Error during login: ${e.message}");
      if (e.response != null) {
        print("Server response: ${e.response!.data}");
        print("Status code: ${e.response!.statusCode}");
      }
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

}
