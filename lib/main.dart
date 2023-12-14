import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'core/utils/helpers.dart';
import 'core/utils/singletons.dart';
import 'data/models/app_config.dart';
import 'data/models/auth_headers.dart';
import 'data/models/session.dart';
import 'firebase_options.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  runApp(const App());
}

_initApp() async {
  await _initEnv();
  await _initConnectivity();
  await _initSingletons();
  await _initNetwork();
  await _initPackageInfo();
  //await _initFirebase();
}

_initConnectivity() async {
  final connectivity = Connectivity();

  final connectivityResult = await connectivity.checkConnectivity();
  isDeviceConnected = connectivityResult != ConnectivityResult.none;

  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // TODO: facciamo uscire un qualche alert?
    isDeviceConnected = (result != ConnectivityResult.none);

    logDebug(isDeviceConnected ? "Connesso" : "Non connesso", tag: "Network");
  });
}

/// Private methods
///
_initEnv() async {
  await env.load(fileName: '.env');

  logDebug('${env.env}', tag: '.env');
}

_initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

_initNetwork() {
  dio.interceptors.add(DioErrorInterceptor());

  logDebug('Dio inizializzato', tag: 'Network');
}

_initPackageInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appConfig.appVersion = packageInfo.version;
  appConfig.buildNumber = packageInfo.buildNumber;

  logDebug("${appConfig.appVersion} (${appConfig.buildNumber})",
      tag: "App Version");
}

_initSingletons() async {
  Get.put(Dio());
  Get.put(AuthHeaders());
  Get.put(AppConfig());
  Get.put(Session());

  // Carico i dati salvati dallo storage
  // FIXME: await AuthStorage.loadStoredData();
  // FIXME:await SettingStorage.loadStoredData();
}
