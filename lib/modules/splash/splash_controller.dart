import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/Welcome/Welcome_page.dart';

import '../../core/utils/helpers.dart';
import '../welcome/welcome_controller.dart';

class SplashController extends GetxController {
  SplashController() {
    _startAnimation();
  }

  _pageTransition() {
    // Transition versio la welcome per gestire l'animazione
    Navigator.of(Get.context!).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
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
      ),
    );
  }

  _startAnimation() async {
    // Aspetto 2 secondi prima di iniziare l'animazione
    await wait(seconds: 2);
    _pageTransition();
  }
}
