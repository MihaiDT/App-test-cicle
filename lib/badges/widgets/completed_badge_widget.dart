import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

class CompletedBadgeWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const CompletedBadgeWidget({
    required this.imageUrl,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.normalGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
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
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: Get.width * 0.27,
              width: Get.width * 0.27,
            ),
            const Spacer(),
            HeadlineSmall(
              title,
              color: ThemeColor.darkBlue,
            ),
            BodySmall(
              description,
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height16,
          ],
        ),
      ),
    );
  }
}
