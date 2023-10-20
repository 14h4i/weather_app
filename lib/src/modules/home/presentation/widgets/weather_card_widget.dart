import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/modules/home/presentation/widgets/temperature_widget.dart';
import 'package:weather_app/src/shared/domain/models/temperature/temperature.dart';
import 'package:weather_app/src/shared/domain/models/weather/weather.dart';
import 'package:weather_app/src/shared/extensions/string_ext.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    required this.cityName,
    required this.weather,
    required this.temperature,
    super.key,
  });

  final String cityName;
  final Weather weather;
  final Temperature temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.24),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Today,',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                cityName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TemperatureWidget(temperature: temperature),
          CachedNetworkImage(
            height: 180,
            imageUrl: weather.iconUrl,
            fit: BoxFit.fitHeight,
          ),
          Text(
            weather.condition,
            style: const TextStyle(fontSize: 32),
          ),
          Text(
            weather.description.capitalize(),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
