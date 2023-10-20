import 'package:flutter/material.dart';
import 'package:weather_app/src/shared/domain/models/temperature/temperature.dart';
import 'package:weather_app/src/shared/extensions/temperature_ext.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({required this.temperature, super.key});

  final Temperature temperature;

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  bool isCelsiusSelected = true;

  void toggleTemperatureUnit() {
    setState(() {
      isCelsiusSelected = !isCelsiusSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isCelsiusSelected
              ? '${widget.temperature.temp.kelvinToCelsius()}°'
              : '${widget.temperature.temp.kelvinToFahrenheit()}°',
          style: const TextStyle(fontSize: 60),
        ),
        const SizedBox(width: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AbsorbPointer(
              absorbing: isCelsiusSelected,
              child: GestureDetector(
                onTap: toggleTemperatureUnit,
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: isCelsiusSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.24),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: const Center(
                    child: Text(
                      'C',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 2),
            AbsorbPointer(
              absorbing: !isCelsiusSelected,
              child: GestureDetector(
                onTap: toggleTemperatureUnit,
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: !isCelsiusSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.24),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: const Center(
                    child: Text(
                      'F',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
