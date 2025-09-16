import 'package:dio/dio.dart';
import 'package:polito_api_flutter/src/constants.dart';
import 'package:polito_api_flutter/src/device_info.dart';

class PolitoApi {
  final Dio _dio;

  PolitoApi({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: baseUrl));
}
