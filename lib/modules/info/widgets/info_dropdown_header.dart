import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';

class InfoDropDownHeader extends StatelessWidget {
  final String title;
  final bool isHidden;

  const InfoDropDownHeader({
    required this.title,
    this.isHidden = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadlineSmall(
          title,
          color: ThemeColor.darkBlue,
        ),
        isHidden
            ? SvgPicture.asset(
                ThemeIcon.arrowUp,
                color: ThemeColor.primary,
              )
            : SvgPicture.asset(
                ThemeIcon.arrowDown,
                color: ThemeColor.primary,
              ),
      ],
    );
  }
}
