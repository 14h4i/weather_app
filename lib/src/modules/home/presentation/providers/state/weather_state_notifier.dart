import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/modules/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/modules/home/presentation/providers/state/weather_state.dart';

class WeatherStateNotifier extends StateNotifier<WeatherState> {
  WeatherStateNotifier(
    this.weatherRepository,
  ) : super(const WeatherState.uninitialized());

  final WeatherRepository weatherRepository;

  Future<void> fetchByCity(String city) async {
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
    } on Exception catch (e) {
      newState = WeatherState.error(error: e);
    }

    state = newState;
  }

  Future<void> fetchByPosition(String lat, String lon) async {
    if (!_isIdle()) {
      return;
    }

    state = const WeatherState.loading();

    WeatherState newState;
    try {
      final response = await weatherRepository.getWeatherByPosition(
        double.parse(lat),
        double.parse(lon),
      );

      newState = WeatherState.data(
        cityName: response.name,
        weathers: response.weather,
        temperature: response.temperature,
      );
    } on Exception catch (e) {
      newState = WeatherState.error(error: e);
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
