import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/walkthrough/controller/walkthrough_controller.dart';
import 'package:lines/widgets/walkthrough/walkthrough_dots_row.dart';

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
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          bottom: 10,
        ),
        child: Obx(
          () {
            return SizedBox(
              height: Get.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible:
                        controller.currentStepIndex.value < numberOfPages - 1,
                    child: WalkthroughDotsRow(
                      currentStepIndex: controller.currentStepIndex.value,
                      numberOfDots: numberOfPages - 1,
                    ),
                  ),
                  PrimaryButton(
                    onPressed: () {
                      if (controller.currentStepIndex.value <
                          numberOfPages - 1) {
                        controller.onTapNext();
                      } else {
                        onTapLetsStart?.call();
                      }
                    },
                    child: TitleLarge(
                      letterSpacing: 2,
                      controller.currentStepIndex.value < numberOfPages - 1
                          ? "CONTINUA"
                          : "AVANTI",
                    ),
                  ),
                  Visibility(
                    visible:
                        controller.currentStepIndex.value < numberOfPages - 1,
                    child: InkWell(
                      onTap: () {
                        if (controller.currentStepIndex.value <
                            numberOfPages - 1) {
                          controller.goToLastPage(numberOfPages - 1);
                        }
                      },
                      child: const TitleMedium(
                        "SALTA",
                        letterSpacing: 2,
                        underline: true,
                      ).applyShaders(context),
                    ),
                  ),
                  ThemeSizedBox.height12,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
