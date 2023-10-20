// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataResponseImpl _$$WeatherDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherDataResponseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: Temperature.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherDataResponseImplToJson(
        _$WeatherDataResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weather': instance.weather,
      'main': instance.temperature,
    };
