import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/helpers/log.dart';

class CalendarScrollController extends GetxController {
  /// The mininimum date to show
  final DateTime minDate;

  /// The maximum date to show
  final DateTime maxDate;

  final Function(DateTime day) onDayChanged;

  final Rxn<DateTime> _rxSelectedDate = Rxn<DateTime>(DateTime.now());

  DateTime? get selectedDate => _rxSelectedDate.value;

  set selectedDate(DateTime? newDate) {
    _rxSelectedDate.value = newDate;
  }

  final int weekdayStart = DateTime.monday;

  final DateTime? focusDate;

  late int weekdayEnd;

  ItemScrollController itemScrollController;

  CalendarScrollController({
    this.focusDate,
    required this.minDate,
    required this.maxDate,
    required this.itemScrollController,
    required this.onDayChanged,
  });

  List<DateTime> months = [];

  @override
  void onInit() {
    super.onInit();
    final x = weekdayStart - 1;
    weekdayEnd = x == 0 ? 7 : x;

    _generateMonths();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusDate != null
          ? jumpToMonth(date: focusDate!)
          : jumpToMonth(date: DateTime.now());
    });
  }

  //add every month to list between minDate and maxDate
  void _generateMonths() {
    DateTime currentDate = DateTime(minDate.year, minDate.month);
    months.add(currentDate);
    while (!(currentDate.year == maxDate.year &&
        currentDate.month == maxDate.month)) {
      currentDate = DateTime(currentDate.year, currentDate.month + 1);
      months.add(currentDate);
    }
  }

  List<String> getDaysOfWeek() {
    List<String> daysOfWeek = ['L', 'M', 'M', 'G', 'V', 'S', 'D'];
    return daysOfWeek;
  }

  void onDayTapped(DateTime day) {
    selectedDate = day;
    onDayChanged(day);
  }

  jumpToMonth({required DateTime date, double alignment = 0}) {
    if (!(date.year >= minDate.year &&
        (date.year > minDate.year || date.month >= minDate.month) &&
        date.year <= maxDate.year &&
        (date.year < maxDate.year || date.month <= maxDate.month))) {
      return;
    }
    int month = ((date.year - minDate.year) * 12) - minDate.month + date.month;

    try {
      itemScrollController.jumpTo(index: month, alignment: alignment);
    } catch (e) {
      logError(error: e);
    }
  }
}
