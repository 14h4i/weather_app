import 'package:weather_app/src/modules/home/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/shared/data/remote/network_service.dart';
import 'package:weather_app/src/shared/domain/models/weather_data_response.dart';

class WeatherRemoteDatasource extends WeatherDatasource {
  WeatherRemoteDatasource(this.networkService);

  final NetworkService networkService;

  @override
  Future<WeatherDataResponse> getByCity(String city) async {
    try {
      final response =
          await networkService.get('/weather', queryParameters: {'q': city});

      return WeatherDataResponse.fromJson(response.data ?? <String, dynamic>{});
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<WeatherDataResponse> getByPosition(double lat, double lon) async {
    try {
      final response = await networkService
          .get('/weather', queryParameters: {'lat': lat, 'lon': lon});

      return WeatherDataResponse.fromJson(response.data ?? <String, dynamic>{});
    } on Exception catch (_) {
      rethrow;
    }
  }
}
