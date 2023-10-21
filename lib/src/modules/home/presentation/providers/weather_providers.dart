import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/modules/home/domain/providers/weather_providers.dart';
import 'package:weather_app/src/modules/home/presentation/providers/state/weather_state.dart';
import 'package:weather_app/src/modules/home/presentation/providers/state/weather_state_notifier.dart';

final weatherStateNotifierProvider =
    StateNotifierProvider<WeatherStateNotifier, WeatherState>(
  (ref) {
    final repository = ref.watch(weatherRepositoryProvider);

    return WeatherStateNotifier(repository);
  },
);

enum TypeSearch { city, position }

final typeSearchProvider = StateProvider<TypeSearch>((ref) => TypeSearch.city);
