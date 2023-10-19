import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/src/configs/app_configs.dart';
import 'package:weather_app/src/shared/data/remote/network_service.dart';
import 'package:weather_app/src/shared/utils/globals.dart';

class DioNetworkService extends NetworkService {
  DioNetworkService(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  final Dio dio;

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Future<Response<Map<String, dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get<Map<String, dynamic>>(
      endpoint,
      queryParameters: queryParameters?..addAll({'appid': AppConfigs.apiKey}),
    );
  }

  @override
  Future<void> post(String endpoint, {Map<String, dynamic>? data}) {
    return dio.post<Map<String, dynamic>>(endpoint, data: data);
  }

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }
}
