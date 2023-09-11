import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/widgets/app_button.dart';

import '../../core/app_theme.dart';
import 'welcome_controller.dart';

class WelcomePage extends GetView {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: AppTheme.decorations.images.bgDark,
        ),
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppTheme.sizes.hTopSafeArea,
                const Spacer(),
                Hero(
                  tag: 'hero_logo',
                  child: SizedBox(
                    height: Get.width * 0.6,
                    width: Get.width * 0.6,
                    child: SvgPicture.asset(
                      AppTheme.icons.logo,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const Spacer(),
                ..._bottomContents(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _bottomContents() {
    Get.put(WelcomeController());
    final controller = Get.find<WelcomeController>();

    // Tenendo la duration più lunga e impostando il testo solo quando parte l'animazione mantengo centrato
    // il logo ad inizio animazione e evito di avere scatti nell'animazione
    return [
      Obx(
        () => AnimatedOpacity(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 1500),
          opacity: controller.startAnimation ? 1 : 0,
          child: Column(
            children: [
              Text(
                "Molto più di un\nperiod tracker.",
                style: AppTheme.fonts.largeLight,
              ),
              AppTheme.sizes.h16,
              Text(
                controller.startAnimation
                    ? "La tua nuova app per vivere e monitorare\nil ciclo mestruale in modo positivo, consapevole e divertente.\n\nSei pronta?"
                    : '',
                style: AppTheme.fonts.bodyLight,
                textAlign: TextAlign.center,
              ),
              AppTheme.sizes.h40,
              const AppButton(
                gradient: false,
                filled: true,
                fullWidth: true,
                text: "INIZIAMO!",
              ),
              AppTheme.sizes.h16,
              Text(
                "Hai un account? ACCEDI",
                style: AppTheme.fonts.bodyLight,
              ),
              AppTheme.sizes.h16,
              AppTheme.sizes.hBottomSafeArea,
            ],
          ),
        ),
      ),
    ];
  }
}
