import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/controllers/my_badges_controller.dart';
import 'package:lines/modules/profile/widgets/badge_tile.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class MyBadgesSection extends GetView<MyBadgesController> {
  const MyBadgesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ThemeSizedBox.height24,
            const DisplayMedium(
              "I miei badge",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            ...List.generate(3, (index) {
              return BadgeTile(
                title: controller.badges[index].title,
                description: controller.badges[index].title,
                imagePath: controller.badges[index].imageUrl,
              );
            }),
            ThemeSizedBox.height8,
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.badges);
              },
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(
                    ThemeSize.paddingSmall,
                  ),
                  child: Row(
                    children: [
                      const TitleLarge(
                        "TUTTI I BADGE",
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
    );
  }
}
