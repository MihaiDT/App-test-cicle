import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lines/app.dart';
import 'package:lines/core/helpers/dependency_injection_manager.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/firebase_options.dart';
import 'package:lines/flavors.dart';
import 'package:lines/repository/dio_interceptor.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
  await _initPackageInfo();
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
    ],
  );

  logDebug('Dio inizializzato', tag: 'Network');
}

_initPackageInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appConfig.appVersion = packageInfo.version;
  appConfig.buildNumber = packageInfo.buildNumber;

  logDebug(
    "${appConfig.appVersion} (${appConfig.buildNumber})",
    tag: "App Version",
  );
}
