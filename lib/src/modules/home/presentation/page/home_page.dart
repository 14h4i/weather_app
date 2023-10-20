import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/res.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/modules/home/presentation/providers/weather_providers.dart';
import 'package:weather_app/src/modules/home/presentation/widgets/enter_city_widget.dart';
import 'package:weather_app/src/modules/home/presentation/widgets/weather_card_widget.dart';
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
    final state = ref.watch(weatherStateNotifierProvider);
    final notifier = ref.read(weatherStateNotifierProvider.notifier);
    final resource = Resource.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          resource.appName,
          style: const TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EnterCity(onSubmit: notifier.fetch),
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
                error: (error) => ErrorMsg(
                  exception: error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
