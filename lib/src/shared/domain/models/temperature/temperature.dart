import 'package:freezed_annotation/freezed_annotation.dart';

part 'temperature.freezed.dart';
part 'temperature.g.dart';

@freezed
class Temperature with _$Temperature {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Temperature({
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required double pressure,
    required double humidity,
  }) = _Temperature;

  const Temperature._();

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}
