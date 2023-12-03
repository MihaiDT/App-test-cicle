import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_theme.dart';
import '../../../widgets/buttons/app_button.dart';
import '../walkthrough_controller.dart';
import 'walkthroug_skip_link.dart';
import 'walkthrough_dots.dart';

class WalkthroughBottom extends StatelessWidget {
  const WalkthroughBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WalkthroughController>();

    return Positioned(
      bottom: ThemeSize.heightSafeAreaBottom + (ThemeSize.heightSafeAreaBottom == 0 ? 24 : 0),
      left: ThemeSize.widthPaddingLarge,
      right: ThemeSize.widthPaddingLarge,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          key: controller.bottomAreaKey,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            WalkthroughDots(
              controller: controller,
            ),
            ThemeSizedBox.height24,
            if (controller.isLastStep) ...[
              const WalktroughSkipLink(),
              ThemeSizedBox.height24,
            ],
            AppButton(
              gradient: true,
              filled: true,
              onTap: () => controller.currentStepIndex < controller.lastStep
                  ? controller.onTapNext()
                  : controller.onTapLetsStart(),
              text: controller.currentStepIndex < controller.lastStep ? "CONTINUA" : "AVANTI",
            ),
            if (!controller.isLastStep) ...[
              ThemeSizedBox.height24,
              const WalktroughSkipLink(),
            ],
          ],
        ),
      ),
    );
  }
}
