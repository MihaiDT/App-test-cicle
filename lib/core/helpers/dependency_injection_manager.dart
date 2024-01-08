import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:lines/app_controller.dart';
import 'package:lines/core/env/enviroment.dart';
import 'package:lines/core/env/prod_env.dart';
import 'package:lines/core/env/staging_env.dart';
import 'package:lines/core/helpers/api.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/data/models/app_config.dart';
import 'package:lines/data/models/auth_headers.dart';
import 'package:lines/data/models/session.dart';
import 'package:lines/flavors.dart';

void dependencyRegister({
  required Flavor flavor,
}) {
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
  Get.put(AppConfig());
  Get.put(Session());

  Get.put(
    SecureStorageManager(),
  );

  Get.put(
    AppController(),
    permanent: true,
  );
}
