import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

import 'package:lines/widgets/layouts/app_scaffold_padding.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

import 'package:lines/widgets/logos/hero_logo.dart';
import 'package:lines/modules/welcome/welcome_controller.dart';
import 'package:lines/modules/welcome/widgets/welcome_body.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppScaffoldPage(
          backgroundImage: ThemeDecoration.images.bgDark,
          scrollController: ScrollController(),
          body: AppScaffoldPadding(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                HeroLogo(
                  size: min(Get.width * 0.7, Get.height * 0.3),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Expanded(
                  child: WelcomeBody(
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
