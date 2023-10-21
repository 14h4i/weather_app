# Weather App

## Project Overview

Weather App is a Flutter mobile application that fetches and displays current weather information for a given location. Users can obtain weather details using either the city name or position (latitude and longitude). The application leverages a range of technologies and libraries, including Flutter Riverpod for state management, Clean Architecture for code organization, go_router for route management, and Dio for making API calls to openweathermap.org.

## Environment

```shell
flutter --version
Flutter 3.13.6 • channel stable • https://github.com/flutter/flutter.git
Framework • revision ead455963c (4 weeks ago) • 2023-09-26 18:28:17 -0700
Engine • revision a794cf2681
Tools • Dart 3.1.3 • DevTools 2.25.0
```

## Clean Architecture

The application adheres to the Clean Architecture design pattern, which promotes the separation of code into distinct layers:

- **Data Layer:** Contains logic for data retrieval from APIs, data storage, and resource management.
- **Domain Layer:** Defines use cases and business logic.
- **Presentation Layer:** Controls the user interface and displays data.

The key purposes and benefits of Clean Architecture include:

1. **Separation of Business Logic and User Interface (UI):** Clean Architecture enforces a clear separation between business logic and the user interface. This enables the development of business logic independently of the UI, making it easier to test and maintain.

2. **Ease of Maintenance and Extensibility:** Clean Architecture simplifies the process of maintaining and extending an application. You can modify or upgrade one part of the application without interfering with other components.

3. **Multi-Platform Integration:** This architecture makes it easy to integrate applications with various platforms (Web, mobile, tablets, etc.) without significant code changes.

4. **Simplified Testing:** By separating business logic and the user interface, testing becomes more straightforward. You can create automated tests for the business logic without the need to simulate the user interface.

5. **Integration with External Services:** Clean Architecture allows seamless integration with external services and libraries without extensive source code changes.

6. **Enhanced Security:** The layers in Clean Architecture help control access permissions and improve application security.

Clean Architecture provides an organized structure for your project, making application development and maintenance more straightforward and efficient. It creates a protective barrier around your application, making internal changes easier without affecting other parts of the codebase.

## State Management with Flutter Riverpod
Flutter Riverpod is used for efficient state management within the application. This ensures a robust mechanism for tracking and updating the application's state.

## Route Management with [go_router](https://pub.dev/packages/go_router)
The application benefits from go_router for route management, enabling precise navigation between different screens and features.

```dart
// lib/src/routes/router.dart

part 'router.g.dart';

final _router = GoRouter(
  routes: $appRoutes,
);

final router = _router;

@TypedGoRoute<RootRoute>(path: '/')
class RootRoute extends GoRouteData {
  const RootRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return HomeRoute().location;
  }
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
```

## Dio Api error interceptor (Handle Error)

```dart
// lib/src/shared/domain/interceptors/api_error_interceptor.dart

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
```

```dart
// lib/src/shared/exceptions/error.dart

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
```

## Home Screen
The Home screen is the central feature of the application and includes the following functionalities:

An input field where users can enter a city name or position.
A toggle button that allows users to switch between two methods of retrieving weather information (by city name or position).
A "Get Weather" button for initiating the weather data retrieval process.

| <img src="https://raw.githubusercontent.com/14h4i/weather_app/main/screenshots/screenshot1.png" width="360" /> | <img src="https://raw.githubusercontent.com/14h4i/weather_app/main/screenshots/screenshot2.png" width="360" /> |
| :------------: | :------------: |
| **By City** | **By Position** |

## Installation and Setup
To install and run the application, follow these steps:

1. Clone this repository to your local machine.

2. Open a terminal and navigate to the folder containing the application's source code.

3. Run the `flutter pub get` command to install the required dependencies.

4. Add your OpenWeatherMap API key to the `lib/src/configs/app_configs.dart` file as follows:

  ```dart
// lib/src/configs/app_configs.dart

class AppConfigs {
...
  static const String apiKey = 'YOUR_API_KEY_HERE';
}
```

5. Run the application using the `flutter run` command.

## External Libraries and APIs
The following libraries and APIs are used in this project:

- [cached_network_image](https://pub.dev/packages/cached_network_image): For efficient image loading.
- [dio](https://pub.dev/packages/dio): For making API calls.
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod): For state management.
- [go_router](https://pub.dev/packages/go_router): For route management.
- Clean Architecture: For code organization.
- [OpenWeatherMap API](https://openweathermap.org/api): For fetching weather information.
Ensure that you keep your API key secure and avoid sharing it publicly.

