// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemperatureImpl _$$TemperatureImplFromJson(Map<String, dynamic> json) =>
    _$TemperatureImpl(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      tempMin: (json['temp_min'] as num).toDouble(),
      tempMax: (json['temp_max'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
    );

Map<String, dynamic> _$$TemperatureImplToJson(_$TemperatureImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
