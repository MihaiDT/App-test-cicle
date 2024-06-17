import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/controllers/my_badges_controller.dart';
import 'package:lines/modules/profile/widgets/badge_tile.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/elevated_card.dart';
import 'package:lines/widgets/loaders/dark_loader.dart';

class MyBadgesSection extends GetView<MyBadgesController> {
  const MyBadgesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedCard(
        color: Colors.white.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
          ),
          child: !controller.showBadgesSection.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ThemeSizedBox.height24,
                    const DisplayMedium(
                      "I tuoi badge",
                      textAlign: TextAlign.center,
                    ).applyShaders(context),
                    ThemeSizedBox.height16,
                    SizedBox(
                      height: Get.width * 0.15,
                      width: Get.width * 0.15,
                      child: const DarkLoader(),
                    ),
                    ThemeSizedBox.height24,
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ThemeSizedBox.height24,
                    const DisplayMedium(
                      "I tuoi badge",
                      textAlign: TextAlign.center,
                    ).applyShaders(context),
                    ThemeSizedBox.height16,
                    ...List.generate(
                      controller.badges.length > 3
                          ? 3
                          : controller.badges.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          child: BadgeTile(
                            title: controller.badges[index].title,
                            description: controller.badges[index].description,
                            imagePath: controller.badges[index].iconUrl,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            progressLabel:
                                controller.badges[index].progressLabel,
                            progressPercentage:
                                (controller.badges[index].progressValue ?? 0)
                                    .toDouble(),
                          ),
                        );
                      },
                    ),
                    ThemeSizedBox.height8,
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.badges);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            ThemeSize.paddingSmall,
                          ),
                          child: Row(
                            children: [
                              const TitleLarge(
                                "TUTTI I BADGE",
                                letterSpacing: 2,
                              ).applyShaders(context),
                              const Spacer(),
                              SvgPicture.asset(
                                ThemeIcon.arrowRight,
                                color: ThemeColor.darkBlue,
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ThemeSizedBox.height20,
                  ],
                ),
        ),
      ),
    );
  }
}
