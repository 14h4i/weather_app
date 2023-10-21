import 'package:weather_app/src/modules/home/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/modules/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/shared/domain/models/weather_data_response.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(this.weatherDatasource);

  final WeatherDatasource weatherDatasource;

  @override
  Future<WeatherDataResponse> getWeatherByCity(String city) =>
      weatherDatasource.getByCity(city);

  @override
  Future<WeatherDataResponse> getWeatherByPosition(double lat, double lon) =>
      weatherDatasource.getByPosition(lat, lon);
}
