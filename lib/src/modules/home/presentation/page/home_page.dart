import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/res.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/modules/home/presentation/providers/weather_providers.dart';
import 'package:weather_app/src/modules/home/presentation/widgets/search_weather.dart';
import 'package:weather_app/src/modules/home/presentation/widgets/weather_card.dart';
import 'package:weather_app/src/shared/components/error/error_msg.dart';
import 'package:weather_app/src/shared/components/loading/loading.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final resource = Resource.of(context);
    final state = ref.watch(weatherStateNotifierProvider);
    final notifier = ref.read(weatherStateNotifierProvider.notifier);
    final isSearchByCity = ref.watch(typeSearchProvider) == TypeSearch.city;

    void fetch(String city, String lat, String lon) {
      if (isSearchByCity) {
        notifier.fetchByCity(city);
      } else {
        notifier.fetchByPosition(lat, lon);
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          resource.appName,
          style: const TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchWeather(
                onSubmit: fetch,
              ),
              const SizedBox(height: 20),
              Container(
                child: state.when(
                  uninitialized: SizedBox.new,
                  loading: Loading.new,
                  data: (cityName, weathers, temperature) {
                    return WeatherCard(
                      cityName: cityName,
                      weather: weathers.first,
                      temperature: temperature,
                    );
                  },
                  error: (error) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ErrorMsg(
                      exception: error,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
