import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/badges/controllers/completed_badges_controller.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class CompletedBadgesPage extends GetView<CompletedBadgesController> {
  const CompletedBadgesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: controller.badges.length,
      itemBuilder: (context, index) {
        return ElevatedCard(
          color: ThemeColor.normalGrey.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
              bottom: 4,
            ),
            child: Column(
              children: [
                ThemeSizedBox.height8,
                Image.asset(
                  ThemeImage.ginecologa,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Placeholder(
                    fallbackHeight: 60,
                  ),
                ),
                const Spacer(),
                HeadlineSmall(
                  controller.badges[index].name,
                  color: ThemeColor.darkBlue,
                ),
                BodySmall(
                  controller.badges[index].description,
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height16,
              ],
            ),
          ),
        );
      },
    );
  }
}
