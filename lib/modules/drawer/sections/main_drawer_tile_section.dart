import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class MainDrawerTileSection extends StatelessWidget {
  final Widget? leadingIcon;
  final String title;
  final Function()? onTap;

  const MainDrawerTileSection({
    required this.title,
    this.leadingIcon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ThemeSizedBox.height16,
          Row(
            children: [
              leadingIcon ??
                  const SizedBox(
                    width: 24,
                  ),
              ThemeSizedBox.width8,
              HeadlineSmall(
                title,
                color: ThemeColor.darkBlue,
              ),
              const Spacer(),
              SvgPicture.asset(
                ThemeIcon.arrowRight,
                color: ThemeColor.primary,
              ),
            ],
          ),
          ThemeSizedBox.height16,
        ],
      ),
    );
  }
}
