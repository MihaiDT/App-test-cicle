import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/app_theme.dart';

class CalendarDaySelectMultipleWidget extends StatelessWidget {
  final bool isSelected;
  final String text;
  final bool isToday;

  final VoidCallback? onDayTapped;

  const CalendarDaySelectMultipleWidget({
    required this.isSelected,
    required this.text,
    required this.isToday,
    this.onDayTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDayTapped,
      child: Column(
        children: [
          BodyLarge(
            text,
            textAlign: TextAlign.center,
            fontWeight: isToday ? ThemeTextStyle.weightExtraBold : ThemeTextStyle.weightMedium,
          ).applyShaders(context),
          isSelected
              ? CircleAvatar(
                  radius: 7,
                  backgroundColor: ThemeColor.menstruationColor,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      1.0,
                    ),
                    child: SvgPicture.asset(
                      ThemeIcon.checkMark,
                    ),
                  ),
                )
              : Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: GradientBoxBorder(
                      gradient: ThemeGradient.primary,
                      width: 1,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
