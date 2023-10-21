// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorResponseDataImpl _$$ErrorResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ErrorResponseDataImpl(
      statusCode: json['cod'] as String,
      message: json['message'] as String,
      errorTitle: json['error_title'] as String?,
      errorCode: json['error_code'] as String?,
    );

Map<String, dynamic> _$$ErrorResponseDataImplToJson(
        _$ErrorResponseDataImpl instance) =>
    <String, dynamic>{
      'cod': instance.statusCode,
      'message': instance.message,
      'error_title': instance.errorTitle,
      'error_code': instance.errorCode,
    };
