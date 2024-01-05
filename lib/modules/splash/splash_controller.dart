import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../core/utils/helpers.dart';
import '../../modules/welcome/welcome_controller.dart';
import '../../modules/welcome/welcome_page.dart';

class SplashPageController extends GetxController {
  SplashPageController() {
    _startAnimation();
  }

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
    // Aspetto 2 secondi prima di iniziare l'animazione
    await wait(seconds: 2);
    _pageTransition();
  }
}
