import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

import '../walkthrough_controller.dart';

class WalktroughSkipLink extends StatelessWidget {
  const WalktroughSkipLink({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WalkthroughController>();

    return InkWell(
      onTap: () => controller.currentStepIndex < controller.lastStep
          ? controller.onTapSkip()
          : {},
      child: Opacity(
        opacity: controller.currentStepIndex < controller.lastStep ? 1 : 0,
        child: Column(
          children: [
            const TitleMedium(
              "SALTA",
              underline: true,
            ).applyShaders(context),
            ThemeSizedBox.height4,
            //FIXME: what's this???
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: ThemeGradient.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
