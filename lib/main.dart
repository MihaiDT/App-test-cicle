import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lines/app.dart';
import 'package:lines/core/helpers/dependency_injection_manager.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/firebase_options.dart';
import 'package:lines/flavors.dart';
import 'package:lines/repository/interceptor/dio_interceptor.dart';
import 'package:lines/repository/interceptor/dio_log_intercpetor.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://fbfb4368c454bd92922315966f6e9e0c@o4506676620099584.ingest.us.sentry.io/4507391102484480';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = F.appFlavor == Flavor.dev ? 1.0 : 0.2;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const App()),
  );
}

_initApp() async {
  await dependencyRegister(
    flavor: F.appFlavor ?? Flavor.dev,
  );
  await _initNetwork();
  _initDeepLinking();
  //await _initFirebase();
}

_initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

_initNetwork() {
  dio.interceptors.addAll(
    [
      DioErrorInterceptor(),
      DioInterceptor(
        dio: dio,
      ),
      DioLogInterceptor(),
    ],
  );

  logDebug('Dio inizializzato', tag: 'Network');
}

/// Manage deep linking
void _initDeepLinking() {
  final appLinks = AppLinks();
  appLinks.allUriLinkStream.listen((uri) async {
    /* logDebug('Deep link: $uri', tag: 'DeepLinkDeepLinkDeepLinkDeepLink');
    appController.hasUsedDeepLink.value = true;
    if (uri.pathSegments.isNotEmpty) {
      final id = uri.pathSegments.last;
      if (id.isNotEmpty) {
        await AdvicesService.fetchSingleArticle(
          "1de3b05f-dfd3-43e7-90a1-72e3e572e0d7",
        );
        Get.toNamed(
          Routes.articleDetailPage,
          arguments: appController.singleArticle.value,
        );
      }
    }*/
  });
}
