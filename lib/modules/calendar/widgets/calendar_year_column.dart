import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/modules/calendar/widgets/calendar_grid_widget.dart';

class CalendarYearColumn extends StatelessWidget {
  final DateTime month;
  final Function(DateTime)? onMonthTapped;

  const CalendarYearColumn({
    required this.month,
    this.onMonthTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleMedium(
              DateTime(
                month.year,
                month.month,
              ).formattedMonth.toUpperCase(),
            ).applyShaders(context),
            ThemeSizedBox.height12,
            InkWell(
              onTap: () => onMonthTapped?.call(month),
              child: IgnorePointer(
                child: CalendarGridWidget(
                  isAnnualCalendar: true,
                  year: month.year,
                  month: month.month,
                  circleRadius: 7,
                  onDayTapped: (DateTime day) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
