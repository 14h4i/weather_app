import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/res.dart';
import 'package:weather_app/src/shared/exceptions/error_response_data.dart';

const String errorCodeUndefined = '000';

ErrorResponseData? _extractErrorResponse(Exception exception) {
  if (exception is ApiError) {
    return exception.data;
  } else {
    return null;
  }
}

String errorTitle({
  required Exception exception,
  required Resource resource,
}) {
  final errorResponseData = _extractErrorResponse(exception);

  return errorResponseData?.errorTitle ?? resource.error;
}

String errorMessage({
  required Exception exception,
  required Resource resource,
}) {
  final errorCodeMessage = resource.errorCode(
    _errorCode(
      exception: exception,
    ),
  );

  final errorResponseData = _extractErrorResponse(exception);

  if (errorResponseData != null) {
    return '${errorResponseData.message}\n\n$errorCodeMessage';
  } else {
    return errorCodeMessage;
  }
}

String _errorCode({
  required Exception exception,
}) {
  final errorResponseData = _extractErrorResponse(exception);

  return errorResponseData?.errorCode ??
      errorResponseData?.statusCode ??
      errorCodeUndefined;
}

/*-------------------------------------------------------*/

abstract class ApiError extends DioException {
  ApiError(this.requestOpts, this.data) : super(requestOptions: requestOpts);

  final RequestOptions requestOpts;
  final ErrorResponseData? data;
}

/// 400
class BadRequestError extends ApiError {
  BadRequestError(super.requestOpts, super.data);
}

/// 401
class UnauthorizedError extends ApiError {
  UnauthorizedError(super.requestOpts, super.data);
}

/// 403
class ForbiddenError extends ApiError {
  ForbiddenError(super.requestOpts, super.data);
}

/// 404
class NotFoundError extends ApiError {
  NotFoundError(super.requestOpts, super.data);
}

/// 429
class TooManyRequestsError extends ApiError {
  TooManyRequestsError(super.requestOpts, super.data);
}

/// 500
class InternalServerError extends ApiError {
  InternalServerError(super.requestOpts, super.data);
}

/// 503
class MaintenanceServerError extends ApiError {
  MaintenanceServerError(super.requestOpts, super.data);
}

/// 504
class GatewayTimeoutError extends ApiError {
  GatewayTimeoutError(super.requestOpts, super.data);
}

class UnknownError extends DioException {
  UnknownError(RequestOptions r) : super(requestOptions: r);
}

class NetworkIsUnreachableError extends DioException {
  NetworkIsUnreachableError(RequestOptions r) : super(requestOptions: r);
}

class BadCertificateError extends DioException {
  BadCertificateError(RequestOptions r) : super(requestOptions: r);
}

/// Connect/Send/Receiver Timeout
class TimeoutError extends DioException {
  TimeoutError(RequestOptions r) : super(requestOptions: r);
}
