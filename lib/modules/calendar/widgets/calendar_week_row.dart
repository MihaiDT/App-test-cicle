import 'package:flutter/material.dart';
import 'package:lines/core/utils/custom_date_utils.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/widgets/dividers/divider_with_gradient.dart';

import '../../../core/app_theme.dart';

class CalendarWeekRow extends StatelessWidget {
  final CalendarController controller;

  const CalendarWeekRow({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.count(
          crossAxisCount: DateTime.daysPerWeek,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: List.generate(
            DateTime.daysPerWeek,
            (index) {
              final weekDay = CustomDateUtils.daysOfWeek[index];
              return Center(
                child: TitleLarge(
                  weekDay,
                  color: ThemeColor.primary,
                ),
              );
            },
          ),
        ),
        DividerWithGradient(gradient: ThemeGradient.primary)
      ],
    );
  }
}
