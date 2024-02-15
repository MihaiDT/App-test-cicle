import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/welcome/welcome_controller.dart';
import 'package:lines/modules/welcome/welcome_page.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/settings_service.dart';
import 'package:lines/routes/routes.dart';

class SplashPageController extends GetxController {
  @override
  @override
  void onInit() async {
    super.onInit();
    ever(
      appController.user.rxValue,
      condition: () => Get.currentRoute == Routes.logo,
      (callback) {
        if (appController.user.responseHandler.isFailed) {
          _startAnimation();
        } else if (appController.user.responseHandler.isSuccessful) {
          Get.offAndToNamed(Routes.main);
        }
      },
    );

    await SettingsService.fetchSettings();
    if (HiveManager.userId.isNotEmpty) {
      await AuthenticationService.fetchUser();
    } else {
      _startAnimation();
    }
  }

  SplashPageController() {}

  _pageTransition() {
    // Navigazione manuale verso la WelcomePage per gestire correttamente l'animazione
    Navigator.of(Get.context!).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          Get.put(WelcomeController());
          return const WelcomePage();
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  _startAnimation() async {
    if (appController.settings.responseHandler.isSuccessful) {
      await wait(seconds: 1);
      _pageTransition();
    }
  }
}
