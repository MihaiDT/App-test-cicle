import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/settings_service.dart';

import '../../modules/welcome/welcome_controller.dart';
import '../../modules/welcome/welcome_page.dart';
import '../../routes/routes.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await SettingsService.fetchSettings();

    _startAnimation();
  }

  SplashPageController() {}

  _pageTransition() {
    // Navigazione manuale verso la WelcomePage per gestire correttamente l'animazione
    Navigator.of(Get.context!).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          Get.put(WelcomeController());
          return const WelcomePage();
        },
        transitionsBuilder:
            (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
