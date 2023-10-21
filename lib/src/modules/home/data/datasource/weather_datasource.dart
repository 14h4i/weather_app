import 'package:weather_app/src/shared/domain/models/weather_data_response.dart';

abstract class WeatherDatasource {
  Future<WeatherDataResponse> getByCity(String city);
  Future<WeatherDataResponse> getByPosition(double lat, double lon);
}
