import 'package:weather_app/src/shared/domain/models/weather_data_response.dart';

abstract class WeatherRepository {
  Future<WeatherDataResponse> getWeatherByCity(String city);
  Future<WeatherDataResponse> getWeatherByPosition(double lat, double lon);
}
