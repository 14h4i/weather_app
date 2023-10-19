import 'package:weather_app/src/modules/home/data/datasource/weather_datasource.dart';
import 'package:weather_app/src/shared/data/remote/network_service.dart';
import 'package:weather_app/src/shared/domain/models/weather_data_response.dart';
import 'package:weather_app/src/shared/exceptions/app_exception.dart';

class WeatherRemoteDatasource extends WeatherDatasource {
  WeatherRemoteDatasource(this.networkService);

  final NetworkService networkService;

  @override
  Future<WeatherDataResponse> get(String city) async {
    try {
      final response =
          await networkService.get('/weather', queryParameters: {'q': city});

      if (response.statusCode == 200 && response.data != null) {
        return WeatherDataResponse.fromJson(response.data!);
      }

      throw AppException(
        message: 'Error: [${response.statusCode}] ${response.data}',
      );
    } on Exception catch (_) {
      rethrow;
    }
  }
}
