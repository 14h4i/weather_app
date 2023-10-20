import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/modules/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/modules/home/presentation/providers/state/weather_state.dart';
import 'package:weather_app/src/shared/exceptions/app_exception.dart';

class WeatherStateNotifier extends StateNotifier<WeatherState> {
  WeatherStateNotifier(
    this.weatherRepository,
  ) : super(const WeatherState.uninitialized());

  final WeatherRepository weatherRepository;

  Future<void> fetch(String city) async {
    if (!_isIdle()) {
      return;
    }

    state = const WeatherState.loading();

    WeatherState newState;
    try {
      final response = await weatherRepository.getWeatherByCity(city);

      newState = WeatherState.data(
        cityName: response.name,
        weathers: response.weather,
        temperature: response.temperature,
      );
    } on DioException catch (e) {
      newState = WeatherState.error(
        error: AppException(
          message: e.message ?? 'something went wrong',
          statusCode: e.response?.statusCode,
        ),
      );
    } on Exception catch (e) {
      newState = WeatherState.error(error: AppException(message: e.toString()));
    }

    state = newState;
  }

  bool _isIdle() {
    return state.when(
      data: (_, __, ___) {
        return true;
      },
      uninitialized: () {
        return true;
      },
      loading: () {
        return false;
      },
      error: (e) {
        return true;
      },
    );
  }
}
