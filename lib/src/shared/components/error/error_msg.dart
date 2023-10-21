import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/res.dart';
import 'package:weather_app/src/shared/exceptions/error.dart';

class ErrorMsg extends StatelessWidget {
  const ErrorMsg({
    required this.exception,
    this.color,
    super.key,
  });

  final Exception exception;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final resource = Resource.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMessage(
                exception: exception,
                resource: resource,
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String firstText(Resource resource) {
    return errorTitle(
      exception: exception,
      resource: resource,
    );
  }

  String secondText(Resource resource) {
    return errorMessage(
      exception: exception,
      resource: resource,
    );
  }
}
