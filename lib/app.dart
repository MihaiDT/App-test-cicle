import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

import 'flavors.dart';
import 'routes/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('it', 'IT'),
      getPages: Pages.pages,
      locale: Get.deviceLocale,
      theme: AppTheme.theme,
      themeMode: ThemeMode.system,
      title: F.title,
      // translations: AppTranslations(),
      supportedLocales: const [
        Locale('it', 'IT'),
      ],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => child ?? const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }
}
