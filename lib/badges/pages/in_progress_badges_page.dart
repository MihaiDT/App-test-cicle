import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/badges/controllers/in_progress_badges_controller.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/widgets/badge_tile.dart';

class InProgressBadgePage extends GetView<InProgressBadgesController> {
  const InProgressBadgePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 60,
      ),
      separatorBuilder: (context, index) => ThemeSizedBox.height8,
      itemCount: controller.badges.length,
      itemBuilder: (context, index) {
        return BadgeTile(
          imagePath: controller.badges[index].imageUrl,
          backgroundColor: ThemeColor.normalGrey.withOpacity(0.3),
          title: controller.badges[index].badgeType,
          description: controller.badges[index].title,
          progressPercentage: controller.badges[index].progressValue != null
              ? controller.badges[index].progressValue! / 10
              : 0,
          progressLabel: controller.badges[index].progressLabel,
        );
      },
    );
  }
}
