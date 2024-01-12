import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';

class CalendarSymptomWidget extends StatelessWidget {
  final String? iconPath;
  final String symptomName;
  final bool selected;
  final VoidCallback? onTap;

  const CalendarSymptomWidget({
    required this.iconPath,
    required this.selected,
    required this.symptomName,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: 96,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: selected
              ? GradientBoxBorder(
                  gradient: ThemeGradient.primary,
                  width: 2,
                )
              : Border.all(color: Colors.transparent),
          color: ThemeColor.opaqueWhite,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeSizedBox.height12,
            iconPath != null
                ? SvgPicture.asset(iconPath!)
                : const SizedBox(
                    width: 32,
                    height: 32,
                    child: Placeholder(),
                  ),
            //FIXME: temp solution , otherwise it will go on pixel overflow
            Flexible(
              child: BodySmall(
                symptomName,
                color: ThemeColor.darkBlue,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
