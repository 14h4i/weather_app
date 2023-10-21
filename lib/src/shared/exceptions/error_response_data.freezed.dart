// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorResponseData _$ErrorResponseDataFromJson(Map<String, dynamic> json) {
  return _ErrorResponseData.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponseData {
  @JsonKey(name: 'cod')
  String get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get errorTitle => throw _privateConstructorUsedError;
  String? get errorCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResponseDataCopyWith<ErrorResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseDataCopyWith<$Res> {
  factory $ErrorResponseDataCopyWith(
          ErrorResponseData value, $Res Function(ErrorResponseData) then) =
      _$ErrorResponseDataCopyWithImpl<$Res, ErrorResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cod') String statusCode,
      String message,
      String? errorTitle,
      String? errorCode});
}

/// @nodoc
class _$ErrorResponseDataCopyWithImpl<$Res, $Val extends ErrorResponseData>
    implements $ErrorResponseDataCopyWith<$Res> {
  _$ErrorResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? errorTitle = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errorTitle: freezed == errorTitle
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorResponseDataImplCopyWith<$Res>
    implements $ErrorResponseDataCopyWith<$Res> {
  factory _$$ErrorResponseDataImplCopyWith(_$ErrorResponseDataImpl value,
          $Res Function(_$ErrorResponseDataImpl) then) =
      __$$ErrorResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cod') String statusCode,
      String message,
      String? errorTitle,
      String? errorCode});
}

/// @nodoc
class __$$ErrorResponseDataImplCopyWithImpl<$Res>
    extends _$ErrorResponseDataCopyWithImpl<$Res, _$ErrorResponseDataImpl>
    implements _$$ErrorResponseDataImplCopyWith<$Res> {
  __$$ErrorResponseDataImplCopyWithImpl(_$ErrorResponseDataImpl _value,
      $Res Function(_$ErrorResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? errorTitle = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_$ErrorResponseDataImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errorTitle: freezed == errorTitle
          ? _value.errorTitle
          : errorTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ErrorResponseDataImpl implements _ErrorResponseData {
  const _$ErrorResponseDataImpl(
      {@JsonKey(name: 'cod') required this.statusCode,
      required this.message,
      this.errorTitle,
      this.errorCode});

  factory _$ErrorResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorResponseDataImplFromJson(json);

  @override
  @JsonKey(name: 'cod')
  final String statusCode;
  @override
  final String message;
  @override
  final String? errorTitle;
  @override
  final String? errorCode;

  @override
  String toString() {
    return 'ErrorResponseData(statusCode: $statusCode, message: $message, errorTitle: $errorTitle, errorCode: $errorCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResponseDataImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.errorTitle, errorTitle) ||
                other.errorTitle == errorTitle) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, message, errorTitle, errorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResponseDataImplCopyWith<_$ErrorResponseDataImpl> get copyWith =>
      __$$ErrorResponseDataImplCopyWithImpl<_$ErrorResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorResponseDataImplToJson(
      this,
    );
  }
}

abstract class _ErrorResponseData implements ErrorResponseData {
  const factory _ErrorResponseData(
      {@JsonKey(name: 'cod') required final String statusCode,
      required final String message,
      final String? errorTitle,
      final String? errorCode}) = _$ErrorResponseDataImpl;

  factory _ErrorResponseData.fromJson(Map<String, dynamic> json) =
      _$ErrorResponseDataImpl.fromJson;

  @override
  @JsonKey(name: 'cod')
  String get statusCode;
  @override
  String get message;
  @override
  String? get errorTitle;
  @override
  String? get errorCode;
  @override
  @JsonKey(ignore: true)
  _$$ErrorResponseDataImplCopyWith<_$ErrorResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
