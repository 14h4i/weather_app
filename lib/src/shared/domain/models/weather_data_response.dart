import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/shared/domain/models/temperature/temperature.dart';
import 'package:weather_app/src/shared/domain/models/weather/weather.dart';

part 'weather_data_response.freezed.dart';
part 'weather_data_response.g.dart';

@freezed
class WeatherDataResponse with _$WeatherDataResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WeatherDataResponse({
    required List<Weather> weather,
    @JsonKey(name: 'main') required Temperature temperature,
  }) = _WeatherDataResponse;

  const WeatherDataResponse._();

  factory WeatherDataResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataResponseFromJson(json);
}
