import 'package:flutter/material.dart';
import 'package:weather_app/src/shared/exceptions/app_exception.dart';

class ErrorMsg extends StatelessWidget {
  const ErrorMsg({
    required this.exception,
    required this.onRetry,
    super.key,
  });

  final AppException exception;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              exception.message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
