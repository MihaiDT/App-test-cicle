import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/access_wrapper/widget/no_internet_connection_dialog.dart';
import 'package:lines/modules/access_wrapper/widget/update_app_dialog.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WrapperAccessController extends GetxController {
  RxBool rxAppNeedsUpdate = false.obs;
  RxBool lockApp = false.obs;

  WrapperAccessController() {
    ever(
      rxAppNeedsUpdate,
      (appNeedsUpdate) {
        if (appNeedsUpdate) {
          lockApp.value = true;
          Overlay.of(Get.context!).insert(
            OverlayEntry(
              builder: (_) {
                return const UpdateAppDialog();
              },
              maintainState: false,
              opaque: false,
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await checkInternetConnection();
    await checkVersion();
  }

  Future<void> checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (appController.settings.value?.androidMinBuildNumber == null) {
      rxAppNeedsUpdate.value = false;
    } else {
      rxAppNeedsUpdate.value = int.parse(packageInfo.buildNumber) <
          appController.settings.value!.androidMinBuildNumber!;
    }
  }

  Future<void> checkInternetConnection() async {
    final connectivityResults = await (Connectivity().checkConnectivity());
    final noInternet = connectivityResults.contains(ConnectivityResult.none);

    if (noInternet) {
      lockApp.value = true;

      final overlayEntry = OverlayEntry(
        builder: (_) {
          return const NoInternetConnectionDialog();
        },
        maintainState: false,
        opaque: false,
      );

      Overlay.of(Get.context!).insert(overlayEntry);

      // Rimuove l'OverlayEntry dopo 4 secondi
      Timer(const Duration(seconds: 4), () {
        overlayEntry.remove();
        lockApp.value = false;
      });
    }
  }
}
