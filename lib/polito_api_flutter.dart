import 'package:dio/dio.dart';
import 'package:polito_api_flutter/src/constants.dart';
import 'package:polito_api_flutter/src/models/request/login_request.dart';
import 'package:polito_api_flutter/src/models/response/student_data.dart';

class PolitoApi {
  final Dio _dio;

  PolitoApi({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl));

  Future<String?> basicLogin(LoginRequest request) async {
    try {
      final data = await request.toJson();

      final response = await _dio.post('/auth/login', data: data);

      if (response.statusCode == 200) {
        final responseToken = response.data['data']['token'] as String?;
        if (responseToken == null) {
          print("Token not found in response");
        }
        return responseToken;
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
    return null;
  }

  Future<StudentData?> me(String token) async {
    try {
      final response = await _dio.get(
        '/me',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        final studentData = StudentData.fromJson(response.data);
        print(
          "User info fetched successfully: ${studentData.firstName} ${studentData.lastName}",
        );
        return studentData;
      } else {
        print("Failed to fetch user info with status: ${response.statusCode}");
        print("Server message: ${response.data}");
      }
    } on DioException catch (e) {
      print("Error during fetching user info: ${e.message}");
      if (e.response != null) {
        print("Server response: ${e.response!.data}");
        print("Status code: ${e.response!.statusCode}");
      }
    } catch (e) {
      print("Unexpected error: $e");
    }
    return null;
  }
}
