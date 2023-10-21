import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/src/modules/home/domain/providers/weather_providers.dart';
import 'package:weather_app/src/modules/home/domain/repositories/weather_repository.dart';
import 'package:weather_app/src/modules/home/presentation/providers/state/weather_state.dart';
import 'package:weather_app/src/modules/home/presentation/providers/state/weather_state_notifier.dart';
import 'package:weather_app/src/modules/home/presentation/providers/weather_providers.dart';
import 'package:weather_app/src/shared/domain/models/weather_data_response.dart';

import 'fake_date.dart';
import 'utils.dart';
import 'weather_state_test.mocks.dart';

@GenerateMocks([
  WeatherRepository,
])
void main() {
  final mockWeatherRepository = MockWeatherRepository();
  final listener = MockListener<WeatherState>();

  WeatherStateNotifier override() {
    final container = ProviderContainer(
      overrides: [
        weatherRepositoryProvider.overrideWithValue(mockWeatherRepository),
      ],
    )..listen(
        weatherStateNotifierProvider,
        listener,
        fireImmediately: true,
      );

    addTearDown(container.dispose);
    return container.read(weatherStateNotifierProvider.notifier);
  }

  setUpAll(() {});

  group('weatherStateNotifier#fetch', () {
    group('getWeatherByCity', () {
      test('success', () async {
        // prepare
        final notifier = override();
        when(mockWeatherRepository.getWeatherByCity(any)).thenAnswer(
          (_) async => const WeatherDataResponse(
            id: 1,
            weather: [fakeWeather1],
            name: 'City 1',
            temperature: fakeTemperature1,
          ),
        );

        // test & verify
        await notifier.fetchByCity('city');
        verifyInOrder([
          listener(any, const WeatherStateUninitialized()),
          listener(any, const WeatherStateLoading()),
          listener(
            any,
            const WeatherStateData(
              cityName: 'City 1',
              weathers: [fakeWeather1],
              temperature: fakeTemperature1,
            ),
          ),
        ]);
      });
      test('failure', () async {
        // prepare
        final notifier = override();
        when(mockWeatherRepository.getWeatherByCity(any)).thenAnswer(
          (_) async => throw Exception('test'),
        );

        // test & verify
        await notifier.fetchByCity('city');
        verifyInOrder([
          listener(any, const WeatherStateUninitialized()),
          listener(any, const WeatherStateLoading()),
          listener(any, argThat(isA<WeatherStateError>())),
        ]);
      });
    });
    group('getWeatherByPosition', () {
      test('success', () async {
        // prepare
        final notifier = override();
        when(mockWeatherRepository.getWeatherByPosition(any, any)).thenAnswer(
          (_) async => const WeatherDataResponse(
            id: 2,
            weather: [fakeWeather2],
            name: 'City 2',
            temperature: fakeTemperature2,
          ),
        );

        // test & verify
        await notifier.fetchByPosition('123', '123');
        verifyInOrder([
          listener(any, const WeatherStateUninitialized()),
          listener(any, const WeatherStateLoading()),
          listener(
            any,
            const WeatherStateData(
              cityName: 'City 2',
              weathers: [fakeWeather2],
              temperature: fakeTemperature2,
            ),
          ),
        ]);
      });
      test('failure', () async {
        // prepare
        final notifier = override();
        when(mockWeatherRepository.getWeatherByPosition(any, any)).thenAnswer(
          (_) async => throw Exception('test'),
        );

        // test & verify
        await notifier.fetchByPosition('123', '123');
        verifyInOrder([
          listener(any, const WeatherStateUninitialized()),
          listener(any, const WeatherStateLoading()),
          listener(any, argThat(isA<WeatherStateError>())),
        ]);
      });
    });
  });
}
