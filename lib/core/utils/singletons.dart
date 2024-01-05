import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lines/app_controller.dart';

import '../../data/models/app_config.dart';

final dio = Get.put<Dio>(
  Dio()
    ..options = BaseOptions(
      headers: {
        "Content-Type": "application/json",
        "x-device-os": Platform.isAndroid ? "android" : "ios",
        "x-app-version": "0.0.1",
        "x-language-code": "it",
      },
    ),
);
final appConfig = Get.find<AppConfig>();

final appController = Get.put(
  AppController(),
  permanent: true,
);