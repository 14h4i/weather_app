import 'package:dio/dio.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  Map<String, dynamic>? updateHeader(Map<String, dynamic> data);

  Future<Response<Map<String, dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<void> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
