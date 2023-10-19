import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/modules/home/data/datasource/weather_remote_datasource.dart';
import 'package:weather_app/src/modules/home/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/src/modules/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/shared/data/remote/network_service.dart';
import 'package:weather_app/src/shared/domain/providers/network_service_provider.dart';

final weatherDatasourceProvider =
    Provider.family<WeatherRemoteDatasource, NetworkService>(
  (_, networkService) => WeatherRemoteDatasource(networkService),
);

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final networkService = ref.watch(netwokServiceProvider);
  final datasource = ref.watch(weatherDatasourceProvider(networkService));
  final repository = WeatherRepositoryImpl(datasource);

  return repository;
});
