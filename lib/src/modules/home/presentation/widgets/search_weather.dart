import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/res.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/modules/home/presentation/providers/weather_providers.dart';
import 'package:weather_app/src/shared/components/custom_text_form_field.dart';

class SearchWeather extends ConsumerStatefulWidget {
  const SearchWeather({required this.onSubmit, super.key});
  final void Function(
    String city,
    String lat,
    String lon,
  ) onSubmit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends ConsumerState<SearchWeather>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String cityName = '';
  String latitude = '';
  String longitude = '';

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resource = Resource.of(context);
    final isSearchByCity = ref.watch(typeSearchProvider) == TypeSearch.city;

    void switchTypeSearch() {
      if (isSearchByCity) {
        ref.read(typeSearchProvider.notifier).state = TypeSearch.position;
      } else {
        ref.read(typeSearchProvider.notifier).state = TypeSearch.city;
      }
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            if (isSearchByCity)
              Column(
                children: [
                  Text(
                    resource.enterInformation,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    labelText: resource.cityName,
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
                ],
              )
            else
              Column(
                children: [
                  Text(
                    resource.enterPosition,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          labelText: resource.latitude,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return resource.notEmpty;
                            }

                            return null;
                          },
                          onSaved: (value) {
                            if (value != null) {
                              latitude = value;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextFormField(
                          labelText: resource.longitude,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return resource.notEmpty;
                            }

                            return null;
                          },
                          onSaved: (value) {
                            if (value != null) {
                              longitude = value;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: switchTypeSearch,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        isSearchByCity ? resource.byPosition : resource.byCity,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        widget.onSubmit.call(cityName, latitude, longitude);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        resource.getWeather,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
