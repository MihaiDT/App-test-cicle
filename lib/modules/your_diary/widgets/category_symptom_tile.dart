import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class CategorySymptomTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  final bool canBePressed;

  const CategorySymptomTile({
    super.key,
    required this.imagePath,
    required this.title,
    this.canBePressed = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: canBePressed ? onTap : null,
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
              color: canBePressed
                  ? ThemeColor.darkBlue
                  : ThemeColor.defaultPeriodColor,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: canBePressed
                  ? ThemeColor.primary
                  : ThemeColor.defaultPeriodColor,
            ),
          ],
        ),
      ),
    );
  }
}
