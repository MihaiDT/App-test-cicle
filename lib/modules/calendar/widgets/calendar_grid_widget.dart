import 'package:flutter/material.dart';
import 'package:lines/core/utils/date_time_extension.dart';

import '../../../data/models/day_values.dart';
import '../calendar_store.dart';
import 'calendar_day_widget.dart';

class CalendarGridWidget extends StatefulWidget {
  final int year;
  final int month;
  final double circleRadius;
  final Function(DateTime) onDayTapped;
  final CalendarStore calendarStore;

  const CalendarGridWidget({
    super.key,
    required this.year,
    required this.month,
    required this.circleRadius,
    required this.onDayTapped,
    required this.calendarStore,
  });

  @override
  State<CalendarGridWidget> createState() => _CalendarGridWidgetState();
}

class _CalendarGridWidgetState extends State<CalendarGridWidget> {
  int start = 0;
  final int weekdayStart = DateTime.monday;
  late int weekdayEnd;

  @override

  /// Calculates the starting and ending days of the week,
  /// and performs setup tasks for the calendar display.
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
                  dayStatus: DayStatus.empty,
                  isToday: dayValues.isToday,
                  isSelected: widget.calendarStore.selectedDate != null
                      ? widget.calendarStore.selectedDate!
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
