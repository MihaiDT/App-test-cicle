import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/controllers/profile_completion_percentage_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/elevated_card.dart';
import 'package:lines/widgets/charts/glowing_linear_progress_indicator.dart';

class ProfileCompletionPercentageSection
    extends GetView<ProfileCompletionPercentageController> {
  const ProfileCompletionPercentageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Visibility(
          visible: !controller.profileIsCompleted.value,
          child: ElevatedCard.withBorder(
            onPressed: () {
              Get.toNamed(Routes.changeProfilePage);
            },
            color: Colors.white,
            borderColor: Colors.white.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 15,
              ),
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Row(
                    children: [
                      ThemeSizedBox.height24,
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constrains.maxWidth * 0.6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DisplayMedium(
                              "Profilo al ${controller.completionPercentage}%",
                            ).applyShaders(context),
                            ThemeSizedBox.height4,
                            RichText(
                              text: TextSpan(
                                text: "Completalo per ottenere il badge: ",
                                style: ThemeTextStyle.bodySmall.copyWith(
                                  color: ThemeColor.darkBlue,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Completa profilo",
                                    style: ThemeTextStyle.titleMedium.copyWith(
                                      color: ThemeColor.darkBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ThemeSizedBox.height4,
                            const TitleMedium(
                              "COMPLETA",
                              underline: true,
                            ).applyShaders(context),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: constrains.maxWidth * 0.1,
                      ),
                      SizedBox(
                        width: constrains.maxWidth * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              ThemeImage.badge,
                            ),
                            ThemeSizedBox.height8,
                            GlowingLinearProgressIndicator(
                              value: controller.completionPercentage / 100,
                            ),
                          ],
                        ),
                      ),
                      ThemeSizedBox.height24,
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
