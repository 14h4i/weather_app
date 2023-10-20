extension TemperatureExt on double {
  int kelvinToCelsius() {
    return (this - 273.15).toInt();
  }

  int kelvinToFahrenheit() {
    return ((this - 273.15) * 9 / 5 + 32).toInt();
  }
}
