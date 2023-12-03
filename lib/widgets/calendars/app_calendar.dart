import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/app_theme.dart';

class AppCalendar extends StatelessWidget {
  const AppCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datePickerFormat = DateFormat('yyyy-MM-dd');
    final oneDayDuration = const Duration(days: 1);

    final now = DateTime.now();

    final day = DateTime(now.year, now.month, 1);
    final firstDayOfMonth = DateTime(day.year, day.month, 1);
    final lastDayOfMonth = DateTime(day.year, day.month + 1, 0);

    List<Widget> children = [];

    // Mese
    children.add(_monthName(firstDayOfMonth));
    children.add(ThemeSizedBox.height20);

    children.add(_separator());
    children.add(ThemeSizedBox.height24);

    // Giorni della settimana
    children.add(_weekDays());
    children.add(ThemeSizedBox.height8);

    // Date
    List<Widget> row = [];
    final cellWidth = (Get.width - (32 * 2)) / 7;

    for (DateTime day = firstDayOfMonth;
        day.isBefore(lastDayOfMonth.add(oneDayDuration));
        day = day.add(oneDayDuration)) {
      if (day.day == 1) {
        // Giorni vuoti prima di inizio mese
        for (int i = 1; i < day.weekday; i++) {
          row.add(
            SizedBox(
              height: 40,
              width: cellWidth,
              child: Text(
                day.day.toString(),
                style: ThemeTextStyle.calendarWeekDay,
              ),
            ),
          );
        }
        row.add(
          SizedBox(
            height: cellWidth,
            width: cellWidth,
            child: Center(
              child: Container(
                color: Colors.pink,
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text(
                    day.day.toString(),
                    textAlign: TextAlign.center,
                    style: ThemeTextStyle.calendarWeekDay,
                  ),
                ),
              ),
            ),
          ),
        );
      }
      children.add(Row(children: row));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: children,
    );
  }

  Widget _separator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: Colors.white,
        height: 0.5,
        width: double.infinity,
      ),
    );
  }

  Widget _monthName(DateTime date) {
    final dateFormat = DateFormat('MMMM yyyy', 'it');

    return Text(
      dateFormat.format(date).toUpperCase(),
      style: ThemeTextStyle.calendarMonth,
      textAlign: TextAlign.center,
    );
  }

  Widget _weekDays() {
    final cellWidth = (Get.width - (32 * 2)) / 7;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: cellWidth,
          child: Center(
            child: Text(
              'L',
              style: ThemeTextStyle.calendarWeekDay,
            ),
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: Center(
            child: Text(
              'M',
              style: ThemeTextStyle.calendarWeekDay,
            ),
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: Center(
            child: Text(
              'M',
              style: ThemeTextStyle.calendarWeekDay,
            ),
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: Center(
            child: Text(
              'G',
              style: ThemeTextStyle.calendarWeekDay,
            ),
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: Center(
            child: Text(
              'V',
              style: ThemeTextStyle.calendarWeekDay,
            ),
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: Center(
            child: Text(
              'S',
              style: ThemeTextStyle.calendarWeekDay,
            ),
          ),
        ),
        SizedBox(
          width: cellWidth,
          child: Center(
            child: Text(
              'D',
              style: ThemeTextStyle.calendarWeekDay,
            ),
          ),
        ),
      ],
    );
  }
}
