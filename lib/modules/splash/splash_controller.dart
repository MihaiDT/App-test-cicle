import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../core/utils/helpers.dart';
import '../../modules/welcome/welcome_page.dart';
import '../../modules/welcome/welcome_controller.dart';

class SplashController extends GetxController {
  SplashController() {
    _startAnimation();

    // TODO: da implementare quando lo richiederanno
    // _biometricAuth();
  }

  _biometricAuth() async {
    final LocalAuthentication auth = LocalAuthentication();

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    logDebug("Posso autenticare: $canAuthenticate", tag: "Biometric auth");

    bool didAuthenticate = false;
    try {
      while (!didAuthenticate) {
        didAuthenticate = await auth.authenticate(
          localizedReason: 'Aaa',
          options: const AuthenticationOptions(
            biometricOnly: false,
            sensitiveTransaction: false,
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
        logDebug("Autenticato: $didAuthenticate", tag: "Biometric auth");
      }

      _startAnimation();
    } on PlatformException catch (error) {
      logError(error: error.toString());
    }
  }

  _pageTransition() {
    // Navigazione manuale verso la WelcomePage per gestire correttamente l'animazione
    Navigator.of(Get.context!).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
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
      ),
    );
  }

  _startAnimation() async {
    // Aspetto 2 secondi prima di iniziare l'animazione
    await wait(seconds: 2);
    _pageTransition();
  }
}
