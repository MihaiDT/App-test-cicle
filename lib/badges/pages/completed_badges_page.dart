import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/badges/controllers/completed_badges_controller.dart';
import 'package:lines/badges/widgets/completed_badge_widget.dart';

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
        childAspectRatio: 0.9,
      ),
      itemCount: controller.badges.length,
      itemBuilder: (context, index) {
        return CompletedBadgeWidget(
          imageUrl: controller.badges[index].iconUrl ?? "",
          title: controller.badges[index].title,
          description: controller.badges[index].description,
        );
      },
    );
  }
}
