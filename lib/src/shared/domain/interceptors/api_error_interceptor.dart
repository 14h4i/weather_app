import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/shared/exceptions/error.dart';
import 'package:weather_app/src/shared/exceptions/error_response_data.dart';

class AppErrorInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('ApiError: ${err.message}, ${err.response}');

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutError(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            final data = deserializeError(err.response);
            throw BadRequestError(err.requestOptions, data);
          case 401:
            final data = deserializeError(err.response);
            throw UnauthorizedError(err.requestOptions, data);
          case 403:
            final data = deserializeError(err.response);
            throw ForbiddenError(err.requestOptions, data);
          case 404:
            final data = deserializeError(err.response);
            throw NotFoundError(err.requestOptions, data);
          case 429:
            final data = deserializeError(err.response);
            throw TooManyRequestsError(err.requestOptions, data);
          case 500:
            final data = deserializeError(err.response);
            throw InternalServerError(err.requestOptions, data);
          case 503:
            final data = deserializeError(err.response);
            throw MaintenanceServerError(err.requestOptions, data);
          case 504:
            final data = deserializeError(err.response);
            throw GatewayTimeoutError(err.requestOptions, data);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw UnknownError(err.requestOptions);
      case DioExceptionType.badCertificate:
        throw BadCertificateError(err.requestOptions);
      case DioExceptionType.connectionError:
        throw NetworkIsUnreachableError(err.requestOptions);
    }

    return handler.next(err);
  }

  ErrorResponseData deserializeError(Response<dynamic>? res) {
    final data = res?.data as Map<String, dynamic>;
    return ErrorResponseData.fromJson(data);
  }
}
