import 'package:dio/dio.dart';
import 'package:polito_api_flutter/src/constants.dart';
import 'package:polito_api_flutter/src/models/request/login_request.dart';
import 'package:polito_api_flutter/src/models/response/student_data.dart';

class PolitoApi {
  final Dio _dio;
  String? _token;

  PolitoApi({Dio? dio, String? token})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl)) {
    if (token != null) {
      setToken(token);
    }
  }

  void setToken(String token) {
    _token = token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<String?> basicLogin(LoginRequest request) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: await request.toJson(),
      );

      if (response.statusCode == 200) {
        final responseToken = response.data['data']['token'] as String?;
        if (responseToken != null) {
          setToken(responseToken);
          return responseToken;
        } else {
          print("Token not found in response");
        }
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

  bool _ensure() {
    if (_token == null) {
      print("No token set. Call login or setToken first.");
      return false;
    }
    return true;
  }

  Future<StudentData?> me() async {
    if (!_ensure()) return null;

    try {
      final response = await _dio.get('/me');
      if (response.statusCode == 200) {
        final studentData = StudentData.fromJson(response.data);
        print(
          "User info fetched successfully: "
          "${studentData.firstName} ${studentData.lastName}",
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

  Future<void> logout() async {
    if (!_ensure()) return;

    try {
      await _dio.delete('/auth/logout');
      _token = null;
      _dio.options.headers.remove('Authorization');
      print("Logged out successfully.");
    } catch (e) {
      print("Error during logout: $e");
    }
  }

}
