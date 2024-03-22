import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/dividers/divider_with_gradient.dart';

class CalendarYearTitleWidget extends StatelessWidget {
  final int year;
  final bool isAttached;

  const CalendarYearTitleWidget({
    required this.year,
    this.isAttached = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isAttached ? null : Colors.transparent,
        gradient: isAttached
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE9D1E0),
                  Color(0xFFF2DCE7),
                ],
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.maxFinite,
      child: Column(
        children: [
          HeadlineMedium(
            "$year",
            color: ThemeColor.primary,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height8,
          DividerWithGradient(
            gradient: ThemeGradient.primary,
          ),
        ],
      ),
    );
  }
}
