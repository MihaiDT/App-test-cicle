import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_theme.dart';
import '../../../widgets/texts/text_gradient.dart';
import '../walkthrough_controller.dart';

class WalktroughSkipLink extends StatelessWidget {
  const WalktroughSkipLink({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WalkthroughController>();

    return InkWell(
      onTap: () => controller.currentStepIndex < controller.lastStep ? controller.onTapSkip() : {},
      child: Opacity(
        opacity: controller.currentStepIndex < controller.lastStep ? 1 : 0,
        child: Column(
          children: [
            TextGradient(
              text: Text(
                "SALTA",
                style: ThemeTextStyle.linkDark,
              ),
            ),
            ThemeSizedBox.height4,
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
