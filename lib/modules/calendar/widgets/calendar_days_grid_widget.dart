import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/date_time_extension.dart';
import 'package:lines/modules/calendar/widgets/calendar_day_widget.dart';

import '../../../data/models/day_values.dart';
import 'calendar_scroll_controller.dart';

class CalendarDaysGridWidget extends StatefulWidget {
  final CalendarScrollController calendarScrollableCalendarController;

  final DateTime gridValue;

  const CalendarDaysGridWidget({
    required this.calendarScrollableCalendarController,
    required this.gridValue,
    super.key,
  });

  @override
  State<CalendarDaysGridWidget> createState() => _CalendarDaysGridWidgetState();
}

class _CalendarDaysGridWidgetState extends State<CalendarDaysGridWidget> {
  int start = 0;

  //This will determine the correct position of the starting day of the month (eg : 1th of february in 2024 will be on thursday , so the day will need to skip 3 days on the grid to be in the correct slot)
  @override
  void initState() {
    super.initState();
    int monthPositionStartDay =
        (widget.calendarScrollableCalendarController.weekdayStart -
                DateTime.daysPerWeek -
                DateTime(
                  widget.gridValue.year,
                  widget.gridValue.month,
                ).weekday)
            .abs();
    monthPositionStartDay = monthPositionStartDay > DateTime.daysPerWeek
        ? monthPositionStartDay - DateTime.daysPerWeek
        : monthPositionStartDay;

    start = monthPositionStartDay == 7 ? 0 : monthPositionStartDay;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      addRepaintBoundaries: false,
      childAspectRatio: 1.0,
      crossAxisCount: DateTime.daysPerWeek,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        DateTime(widget.gridValue.year, widget.gridValue.month + 1, 0).day +
            start,
        (index) {
          final day = DateTime(widget.gridValue.year, widget.gridValue.month,
              (index + 1 - start));
          final text = (index + 1 - start).toString();

          final dayValues = DayValues(
            day: day,
            isFirstDayOfWeek: day.weekday ==
                widget.calendarScrollableCalendarController.weekdayStart,
            isLastDayOfWeek: day.weekday ==
                widget.calendarScrollableCalendarController.weekdayEnd,
            text: text,
          );

          return Visibility(
            visible: index >= start,
            child: GestureDetector(
              onTap: () {
                widget.calendarScrollableCalendarController.onDayTapped(day);
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Obx(
                    () => CalendarDayWidget(
                      dayStatus: DayStatus.empty,
                      isToday: dayValues.isToday,
                      // isSelected: calendarScrollableCalendarController
                      //     .selectedDate
                      //     .isSameDay(dayValues.day),
                      isSelected: widget.calendarScrollableCalendarController
                                  .selectedDate !=
                              null
                          ? widget.calendarScrollableCalendarController
                              .selectedDate!
                              .isSameDay(dayValues.day)
                          : false,
                      parentConstraints: constraints,
                      text: text,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
