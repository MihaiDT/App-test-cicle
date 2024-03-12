import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_gradient.dart';
import 'package:lines/core/theme/theme_text_style.dart';

class CalendarChip extends StatelessWidget {
  final String? iconPath;
  final String label;

  const CalendarChip({
    super.key,
    this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: GradientBoxBorder(
          gradient: ThemeGradient.primary,
        ),
        borderRadius: BorderRadius.circular(81),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconPath != null
              ? SizedBox(
                  width: 18,
                  height: 18,
                  child: SvgPicture.asset(iconPath ?? ''),
                )
              : const SizedBox(
                  height: 20,
                  width: 20,
                  child: Placeholder(),
                ),
          const SizedBox(
            width: 2,
          ),
          BodySmall(
            label,
            color: ThemeColor.darkBlue,
            fontWeight: NewThemeTextStyle.weightMedium,
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
    );
  }
}
