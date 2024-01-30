import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/utils/date_time_extension.dart';

import '../../../core/utils/singletons.dart';
import '../../../data/models/day_values.dart';
import '../../../data/models/period_status.dart';
import '../calendar_controller.dart';
import 'calendar_day_widget.dart';

class CalendarGridWidget extends StatefulWidget {
  final int year;
  final int month;
  final double circleRadius;
  final Function(DateTime) onDayTapped;
  final bool selectMode;

  const CalendarGridWidget({
    super.key,
    required this.year,
    required this.month,
    required this.circleRadius,
    required this.onDayTapped,
    this.selectMode = false,
  });

  @override
  State<CalendarGridWidget> createState() => _CalendarGridWidgetState();
}

class _CalendarGridWidgetState extends State<CalendarGridWidget> {
  int start = 0;
  final int weekdayStart = DateTime.monday;
  late int weekdayEnd;
  CalendarController controller = Get.find<CalendarController>();

  /// Calculates the starting and ending days of the week,
  /// and performs setup tasks for the calendar display.
  @override
  void initState() {
    final int weekdayStartOffset = weekdayStart - 1;
    weekdayEnd = weekdayStartOffset == 0 ? 7 : weekdayStartOffset;
    int monthPositionStartDay = (weekdayStart -
            DateTime.daysPerWeek -
            DateTime(widget.year, widget.month).weekday)
        .abs();
    monthPositionStartDay = monthPositionStartDay > DateTime.daysPerWeek
        ? monthPositionStartDay - DateTime.daysPerWeek
        : monthPositionStartDay;
    start = monthPositionStartDay == 7 ? 0 : monthPositionStartDay;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: DateTime.daysPerWeek,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(
        DateTime(widget.year, widget.month + 1, 0).day + start,
        (index) {
          final day = DateTime(
            widget.year,
            widget.month,
            (index + 1 - start),
          );
          String formattedDate = DateFormat('yyyy-MM-dd').format(day);
          PeriodStatus? status;
          status =
              appController.periodMap.value?.dates[formattedDate];
          final text = (index + 1 - start).toString();
          final dayValues = DayValues(
            day: day,
            isFirstDayOfWeek: day.weekday == weekdayStart,
            isLastDayOfWeek: day.weekday == weekdayEnd,
            text: text,
          );
          return Visibility(
            visible: index >= start,
            child: LayoutBuilder(
              builder: (context, constraints) => InkWell(
                onTap: () {
                  widget.onDayTapped(day);
                  setState(() {});
                },
                child: CalendarDayWidget(
                  circleRadius: widget.circleRadius,
                  padding: const EdgeInsets.all(2),
                  dayStatus:
                      status != null ? DayStatus.filledRed : DayStatus.empty,
                  isToday: dayValues.isToday,
                  isSelected: controller.calendarStore.selectedDate != null
                      ? controller.calendarStore.selectedDate!
                          .isSameDay(dayValues.day)
                      : false,
                  parentConstraints: constraints,
                  text: text,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
