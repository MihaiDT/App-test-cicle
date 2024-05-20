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

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  runApp(const App());
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
