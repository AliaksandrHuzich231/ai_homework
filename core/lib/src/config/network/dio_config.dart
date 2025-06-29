import 'dart:async';

import 'package:dio/dio.dart';
import '../app_config.dart';

class DioConfig {
  final AppConfig appConfig;
  static const int timeout = 10 * 1000;

  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioConfig({required this.appConfig}) {
    _dio.options.baseUrl = appConfig.baseUrl;
  }
}
