import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class CategorySymptomTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  const CategorySymptomTile({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 14,
              height: 14,
            ),
            ThemeSizedBox.width6,
            HeadlineSmall(
              title,
              color: ThemeColor.darkBlue,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: ThemeColor.primary,
            ),
          ],
        ),
      ),
    );
  }
}
