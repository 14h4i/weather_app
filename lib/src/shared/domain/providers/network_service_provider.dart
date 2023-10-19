import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/shared/data/remote/dio_network_service.dart';
import 'package:weather_app/src/shared/data/remote/network_service.dart';

final netwokServiceProvider = Provider<NetworkService>(
  (ref) {
    final dio = Dio();
    return DioNetworkService(dio);
  },
);
