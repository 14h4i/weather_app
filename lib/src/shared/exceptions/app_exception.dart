class AppException implements Exception {
  AppException({
    required this.message,
    this.statusCode,
    this.identifier,
  });

  final String message;
  final int? statusCode;
  final String? identifier;

  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}
