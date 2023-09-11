import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/widgets/app_button.dart';

import '../../core/app_theme.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

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
          child: Hero(
            tag: 'hero_logo',
            child: SizedBox(
              height: Get.width * 0.9,
              width: Get.width * 0.9,
              child: SvgPicture.asset(
                AppTheme.icons.logo,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
