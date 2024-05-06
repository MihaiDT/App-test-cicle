import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/welcome/welcome_controller.dart';
import 'package:lines/modules/welcome/widgets/welcome_signin_button.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';
import 'package:lines/widgets/logos/hero_logo.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      scrollController: ScrollController(),
      body: SafeArea(
        child: BottomWidgetLayout(
          bottomWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WelcomeSigninButton(
                  controller,
                ),
                ThemeSizedBox.height16,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const TitleMedium(
                      "Hai già un account Lines?",
                      fontWeight: FontWeight.w500,
                    ),
                    ThemeSizedBox.width4,
                    GestureDetector(
                      onTap: () {
                        appController.isLoginFlow.value = true;
                        Get.toNamed(
                          Routes.cookie,
                        );
                      },
                      child: const TitleMedium(
                        "ACCEDI",
                        underline: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          child: Obx(
            () {
              return Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  HeroLogo(
                    size: Get.height * 0.3,
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const DisplayMedium(
                    "Molto più di un\ncalendario mestruale",
                    textAlign: TextAlign.center,
                  ),
                  ThemeSizedBox.height20,
                  BodyLarge(
                    controller.startAnimation
                        ? "La tua nuova app per vivere e monitorare\nil ciclo mestruale in modo positivo,\nconsapevole e divertente.\n\nSei pronta?"
                        : '',
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
