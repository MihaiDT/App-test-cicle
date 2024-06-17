import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/profile/widgets/my_badges_section.dart';
import 'package:lines/modules/profile/widgets/my_menses_section.dart';
import 'package:lines/modules/profile/widgets/profile_app_bar.dart';
import 'package:lines/modules/profile/widgets/profile_completition_percentage_section.dart';
import 'package:lines/modules/profile/widgets/profile_header.dart';
import 'package:lines/modules/profile/widgets/your_diary_section.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const ProfileAppBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingSmall,
              ),
              children: [
                ThemeSizedBox.height12,
                const ProfileHeader(),
                ThemeSizedBox.height24,
                const ProfileCompletionPercentageSection(),
                ThemeSizedBox.height16,
                const MyMensesSection(),
                ThemeSizedBox.height16,
                const YourDiarySection(),
                ThemeSizedBox.height16,
                Obx(() {
                  return (appController.user.responseHandler.isSuccessful &&
                          (appController
                                  .user.value!.hasConsentCookieProfiling ??
                              false))
                      ? const MyBadgesSection()
                      : _disabledBadgeSection();
                }),
                ThemeSizedBox.height40,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _disabledBadgeSection() {
    final double width = Get.width - (ThemeSize.paddingSmall * 2);
    final double height = (width * 486.0) / 341.0;

    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          height: height,
          width: width,
          child: Image.asset(
            ThemeImage.blurredBadges,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: height,
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingMedium,
          ),
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DisplayMedium(
                "Ops...\nNo cookie, no badge!",
                color: ThemeColor.darkBlue,
                textAlign: TextAlign.center,
              ).applyShaders(Get.context!),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Per visualizzare questa sezione devi prima concedere il consenso ai cookie.",
                color: ThemeColor.darkBlue,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          height: height,
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
            vertical: ThemeSize.paddingSmall,
          ),
          width: width,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => appController.user.responseHandler.isSuccessful
                      ? SecondaryButton(
                          onPressed: () => Get.toNamed(Routes.editCookies),
                          child: const TitleLarge(
                            "MODIFICA CONSENSO",
                          ).applyShaders(Get.context!),
                        )
                      : SizedBox(
                          height: 40,
                          width: 40,
                          child: LottieBuilder.asset(
                            "assets/lottie/dark_loader.json",
                          ),
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
