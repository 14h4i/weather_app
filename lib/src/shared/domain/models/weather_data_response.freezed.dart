// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherDataResponse _$WeatherDataResponseFromJson(Map<String, dynamic> json) {
  return _WeatherDataResponse.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Weather> get weather => throw _privateConstructorUsedError;
  @JsonKey(name: 'main')
  Temperature get temperature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataResponseCopyWith<WeatherDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataResponseCopyWith<$Res> {
  factory $WeatherDataResponseCopyWith(
          WeatherDataResponse value, $Res Function(WeatherDataResponse) then) =
      _$WeatherDataResponseCopyWithImpl<$Res, WeatherDataResponse>;
  @useResult
  $Res call(
      {int id,
      String name,
      List<Weather> weather,
      @JsonKey(name: 'main') Temperature temperature});

  $TemperatureCopyWith<$Res> get temperature;
}

/// @nodoc
class _$WeatherDataResponseCopyWithImpl<$Res, $Val extends WeatherDataResponse>
    implements $WeatherDataResponseCopyWith<$Res> {
  _$WeatherDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? weather = null,
    Object? temperature = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as Temperature,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureCopyWith<$Res> get temperature {
    return $TemperatureCopyWith<$Res>(_value.temperature, (value) {
      return _then(_value.copyWith(temperature: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherDataResponseImplCopyWith<$Res>
    implements $WeatherDataResponseCopyWith<$Res> {
  factory _$$WeatherDataResponseImplCopyWith(_$WeatherDataResponseImpl value,
          $Res Function(_$WeatherDataResponseImpl) then) =
      __$$WeatherDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      List<Weather> weather,
      @JsonKey(name: 'main') Temperature temperature});

  @override
  $TemperatureCopyWith<$Res> get temperature;
}

/// @nodoc
class __$$WeatherDataResponseImplCopyWithImpl<$Res>
    extends _$WeatherDataResponseCopyWithImpl<$Res, _$WeatherDataResponseImpl>
    implements _$$WeatherDataResponseImplCopyWith<$Res> {
  __$$WeatherDataResponseImplCopyWithImpl(_$WeatherDataResponseImpl _value,
      $Res Function(_$WeatherDataResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? weather = null,
    Object? temperature = null,
  }) {
    return _then(_$WeatherDataResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as Temperature,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WeatherDataResponseImpl extends _WeatherDataResponse {
  const _$WeatherDataResponseImpl(
      {required this.id,
      required this.name,
      required final List<Weather> weather,
      @JsonKey(name: 'main') required this.temperature})
      : _weather = weather,
        super._();

  factory _$WeatherDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<Weather> _weather;
  @override
  List<Weather> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  @JsonKey(name: 'main')
  final Temperature temperature;

  @override
  String toString() {
    return 'WeatherDataResponse(id: $id, name: $name, weather: $weather, temperature: $temperature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_weather), temperature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataResponseImplCopyWith<_$WeatherDataResponseImpl> get copyWith =>
      __$$WeatherDataResponseImplCopyWithImpl<_$WeatherDataResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataResponseImplToJson(
      this,
    );
  }
}

abstract class _WeatherDataResponse extends WeatherDataResponse {
  const factory _WeatherDataResponse(
          {required final int id,
          required final String name,
          required final List<Weather> weather,
          @JsonKey(name: 'main') required final Temperature temperature}) =
      _$WeatherDataResponseImpl;
  const _WeatherDataResponse._() : super._();

  factory _WeatherDataResponse.fromJson(Map<String, dynamic> json) =
      _$WeatherDataResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<Weather> get weather;
  @override
  @JsonKey(name: 'main')
  Temperature get temperature;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDataResponseImplCopyWith<_$WeatherDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
