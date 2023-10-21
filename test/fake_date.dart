import 'package:weather_app/src/shared/domain/models/temperature/temperature.dart';
import 'package:weather_app/src/shared/domain/models/weather/weather.dart';

const fakeWeather1 = Weather(
  id: 1,
  weatherCondition: Condition.clear,
  description: 'Fake weather description',
  iconCode: '01d',
);

const fakeWeather2 = Weather(
  id: 2,
  weatherCondition: Condition.rain,
  description: 'Fake weather description',
  iconCode: '10d',
);

const fakeTemperature1 = Temperature(
  temp: 301.18,
  feelsLike: 299.85,
  tempMin: 301.18,
  tempMax: 301.18,
  pressure: 1009,
  humidity: 17,
);

const fakeTemperature2 = Temperature(
  temp: 300.16,
  feelsLike: 304.35,
  tempMin: 300.16,
  tempMax: 300.16,
  pressure: 1012,
  humidity: 94,
);
