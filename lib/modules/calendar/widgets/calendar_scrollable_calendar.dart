import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/theme/text_wrapper.dart';
import 'calendar_days_grid_widget.dart';
import 'calendar_scroll_controller.dart';

class ScrollableCalendar extends StatelessWidget {
  final double spaceBetweenCalendars;
  final CalendarScrollController calendarScrollableCalendarController;

  const ScrollableCalendar({
    required this.calendarScrollableCalendarController,
    required this.spaceBetweenCalendars,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.separated(
      itemScrollController:
          calendarScrollableCalendarController.itemScrollController,
      separatorBuilder: (_, __) => SizedBox(height: spaceBetweenCalendars),
      itemCount: calendarScrollableCalendarController.months.length,
      itemBuilder: (context, index) {
        final DateTime month =
            calendarScrollableCalendarController.months[index];
        //if you reached the end then add some space after the last month
        if (index >= calendarScrollableCalendarController.months.length - 1) {
          return Column(
            children: [
              _childColumn(month, context),
              SizedBox(height: Get.height * 0.3),
            ],
          );
        }
        return _childColumn(month, context);
      },
    );
  }

  Widget _childColumn(DateTime month, context) {
    final String monthText = DateFormat('MMMM', 'it')
        .format(DateTime(month.year, month.month))
        .toUpperCase();

    return Column(
      children: [
        TitleMedium(monthText).applyShaders(context),
        Divider(
          thickness: 1,
          color: Colors.black.withOpacity(0.1),
        ),
        CalendarDaysGridWidget(
          calendarScrollableCalendarController:
              calendarScrollableCalendarController,
          gridValue: month,
        ),
      ],
    );
  }
}
