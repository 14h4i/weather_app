import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response_data.freezed.dart';
part 'error_response_data.g.dart';

@freezed
class ErrorResponseData with _$ErrorResponseData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ErrorResponseData({
    @JsonKey(name: 'cod') required String statusCode,
    required String message,
    String? errorTitle,
    String? errorCode,
  }) = _ErrorResponseData;

  factory ErrorResponseData.fromJson(Map<String, Object?> json) =>
      _$ErrorResponseDataFromJson(json);
}
