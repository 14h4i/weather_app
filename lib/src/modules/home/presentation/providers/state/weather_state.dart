import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/shared/domain/models/temperature/temperature.dart';
import 'package:weather_app/src/shared/domain/models/weather/weather.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.uninitialized() = WeatherStateUninitialized;

  const factory WeatherState.loading() = WeatherStateLoading;

  const factory WeatherState.data({
    required String cityName,
    required List<Weather> weathers,
    required Temperature temperature,
  }) = WeatherStateData;

  const factory WeatherState.error({required Exception error}) =
      WeatherStateError;
}
