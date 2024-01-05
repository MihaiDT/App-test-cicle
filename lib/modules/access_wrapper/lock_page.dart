import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/logos/hero_logo.dart';

class LockPage extends StatelessWidget {
  const LockPage({super.key});

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
