import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_theme.dart';
import '../welcome_controller.dart';
import 'welcome_signin_button.dart';

class WelcomeBody extends StatelessWidget {
  final WelcomeController controller;

  const WelcomeBody({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Tenendo la duration più lunga e impostando il testo solo quando parte l'animazione mantengo centrato
    // il logo ad inizio animazione e evito di avere scatti nell'animazione
    return Obx(
      () => AnimatedOpacity(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 1500),
        opacity: controller.startAnimation ? 1 : 0,
        child: Column(
          children: [
            Text(
              "Molto più di un\ncalendario mestruale",
              style: ThemeTextStyle.largeLight,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height20,
            Text(
              controller.startAnimation
                  ? "La tua nuova app per vivere e monitorare\nil ciclo mestruale in modo positivo,\nconsapevole e divertente.\n\nSei pronta?"
                  : '',
              style: ThemeTextStyle.bodyLight,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height40,
            WelcomeSigninButton(controller),
            ThemeSizedBox.height16,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Hai un account?",
                  style: ThemeTextStyle.bodySmallLight,
                ),
                ThemeSizedBox.width4,
                Text(
                  "ACCEDI",
                  style: ThemeTextStyle.ctaLight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
