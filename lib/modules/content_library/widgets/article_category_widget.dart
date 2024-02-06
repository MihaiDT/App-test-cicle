import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

class ArticleCategoryWidget extends StatelessWidget {
  final String articleName;

  const ArticleCategoryWidget({
    required this.articleName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadlineSmall(
          articleName.capitalizeFirst ?? articleName,
          color: ThemeColor.darkBlue,
        ),
        SvgPicture.asset(
          ThemeIcon.arrowRight,
          color: ThemeColor.primary.withOpacity(0.5),
        ),
      ],
    );
  }
}
