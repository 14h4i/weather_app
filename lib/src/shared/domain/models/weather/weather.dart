import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/configs/app_configs.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

enum Condition { thunderstorm, drizzle, rain, snow, atmosphere, clear, clouds }

@freezed
class Weather with _$Weather {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Weather({
    required int id,
    @JsonKey(name: 'main')
    @ConditionEnumConverter()
    required Condition weatherCondition,
    required String description,
    @JsonKey(name: 'icon') required String iconCode,
    String? reason,
  }) = _Weather;

  const Weather._();

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  String get condition =>
      weatherCondition.name[0].toUpperCase() +
      weatherCondition.name.substring(1);

  String get iconUrl => '${AppConfigs.iconWeatherUrl}$iconCode@4x.png';
}

class ConditionEnumConverter implements JsonConverter<Condition, String> {
  const ConditionEnumConverter();

  @override
  Condition fromJson(String json) =>
      Condition.values.byName(json.toLowerCase());

  @override
  String toJson(Condition object) =>
      object.name[0].toUpperCase() + object.name.substring(1);
}
