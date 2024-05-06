import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lines/app_controller.dart';
import 'package:lines/core/env/enviroment.dart';
import 'package:lines/core/env/prod_env.dart';
import 'package:lines/core/env/staging_env.dart';
import 'package:lines/core/helpers/api.dart';
import 'package:lines/core/helpers/logger/logger.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/data/models/auth_headers.dart';
import 'package:lines/flavors.dart';

Future<void> dependencyRegister({
  required Flavor flavor,
}) async {
  Get.put<Environment>(
    flavor.isDevFlavor ? StagingEnv() : ProdEnv(),
  );

  Get.put(
    Dio()
      ..options = BaseOptions(
        baseUrl: apiEndpoint,
        headers: {
          "Content-Type": "application/json",
          "x-device-os": Platform.isAndroid ? "android" : "ios",
          "x-app-version": "0.0.1",
          "x-language-code": "it",
        },
      ),
  );

  Get.put(AuthHeaders());

  await _registerHive();

  Get.put(
    SecureStorageManager(),
  );

  Get.put(
    CustomLogger(),
  );

  Get.put(
    AppController.initial(),
    permanent: true,
  );
}

/// Register alla the Hive  boxes andadapters
Future<void> _registerHive() async {
  await Hive.initFlutter();
  await Hive.openBox("linesApp");
}
