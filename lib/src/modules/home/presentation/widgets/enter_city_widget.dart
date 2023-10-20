import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/res.dart';

class EnterCity extends StatefulWidget {
  const EnterCity({required this.onSubmit, super.key});
  final void Function(String city) onSubmit;

  @override
  State<EnterCity> createState() => _EnterCityState();
}

class _EnterCityState extends State<EnterCity> {
  final _formKey = GlobalKey<FormState>();
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    final resource = Resource.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            resource.enterInformation,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: resource.enterYourCity,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return resource.notEmpty;
                }

                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  cityName = newValue;
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState != null &&
                  _formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSubmit.call(cityName);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                resource.getWeather,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
