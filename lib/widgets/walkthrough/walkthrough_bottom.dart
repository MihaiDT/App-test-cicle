import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/walkthrough/walkthrough_dots_row.dart';
import 'package:lines/widgets/walkthrough/controller/walkthrough_controller.dart';

class WalkthroughBottom extends GetView<WalkthroughController> {
  final int numberOfPages;
  final VoidCallback? onTapLetsStart;

  const WalkthroughBottom({
    required this.numberOfPages,
    this.onTapLetsStart,
    super.key,
  });

  double get verticalPadding => Get.height * 0.05;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Visibility(
                visible: controller.currentStepIndex.value < numberOfPages - 1,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: verticalPadding,
                  ),
                  child: WalkthroughDotsRow(
                    currentStepIndex: controller.currentStepIndex.value,
                    numberOfDots: numberOfPages - 1,
                  ),
                ),
              ),
            ),
            PrimaryButton(
              onPressed: () {
                if (controller.currentStepIndex.value < numberOfPages - 1) {
                  controller.onTapNext();
                } else {
                  onTapLetsStart?.call();
                }
              },
              child: Obx(
                () => TitleLarge(
                  controller.currentStepIndex.value < numberOfPages - 1
                      ? "CONTINUA"
                      : "AVANTI",
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.currentStepIndex.value < numberOfPages - 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (controller.currentStepIndex.value <
                          numberOfPages - 1) {
                        controller.goToLastPage(numberOfPages - 1);
                      }
                    },
                    child: const TitleMedium(
                      "SALTA",
                      underline: true,
                    ).applyShaders(context),
                  ),
                ),
              ),
            ),
            ThemeSizedBox.height32,
          ],
        ),
      ),
    );
  }
}
