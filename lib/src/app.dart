import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/res.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/src/routes/router.dart';
import 'package:weather_app/src/shared/domain/providers/app_provider.dart';
import 'package:weather_app/src/shared/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      routerConfig: router,
      localizationsDelegates: Resource.localizationsDelegates,
      supportedLocales: Resource.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.any(
          (element) =>
              locale?.languageCode.contains(element.toString()) ?? false,
        )) {
          final currentLanguageCode = ref.watch(localeCodeProvider);
          if (currentLanguageCode != locale!.languageCode) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              ref.watch(localeCodeProvider.notifier).state =
                  locale.languageCode;
            });
          }

          return locale;
        }
        return const Locale('en', '');
      },
    );
  }
}
