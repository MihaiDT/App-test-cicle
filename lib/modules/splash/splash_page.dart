import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_theme.dart';
import '../../widgets/layouts/app_scaffold_page.dart';
import '../../widgets/logos/hero_logo.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      scrollController: ScrollController(),
      body: Center(
        child: HeroLogo(
          size: heroLogoWidth,
        ),
      ),
    );
  }

  double get heroLogoWidth => Get.width * 0.9;
}
