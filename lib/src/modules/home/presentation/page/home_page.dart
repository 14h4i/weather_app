import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/modules/home/presentation/providers/weather_providers.dart';
import 'package:weather_app/src/shared/components/error/error_msg.dart';
import 'package:weather_app/src/shared/components/loading/loading.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weatherStateNotifierProvider);
    final notifier = ref.read(weatherStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter City:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter your city',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                notifier.fetch(controller.text);
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            // Display Weather Information Here (Temperature and Condition)
            Container(
              child: state.when(
                uninitialized: SizedBox.new,
                loading: Loading.new,
                data: (weather, temperature) {
                  return Column(
                    children: [
                      Text(
                        'Temperature: ${temperature.temp}°K',
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Condition: ${weather.first.condition}',
                        style: const TextStyle(fontSize: 24),
                      ),
                      weather.first.icon,
                    ],
                  );
                },
                error: (error) => ErrorMsg(
                  exception: error,
                  onRetry: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
