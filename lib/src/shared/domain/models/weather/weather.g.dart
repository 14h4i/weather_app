// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      id: json['id'] as int,
      weatherCondition:
          const ConditionEnumConverter().fromJson(json['main'] as String),
      description: json['description'] as String,
      iconCode: json['icon'] as String,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': const ConditionEnumConverter().toJson(instance.weatherCondition),
      'description': instance.description,
      'icon': instance.iconCode,
      'reason': instance.reason,
    };
