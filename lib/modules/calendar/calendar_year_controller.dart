import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarYearController extends GetxController {
  final StickyHeaderController stickyHeaderController =
      StickyHeaderController();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();

  /// The minimum date to show
  final DateTime minDate;

  /// The maximum date to show
  final DateTime maxDate;

  final CalendarController calendarController = Get.find<CalendarController>();

  CalendarYearController({
    required this.minDate,
    required this.maxDate,
  });

  late final List<DateTime> years;
  late final Map<int, int> yearIndexMap;

  @override
  void onInit() {
    super.onInit();
    _generateYears();
  }

  /// Returns the index of the year in the list
  int indexOfYear(DateTime date) {
    return yearIndexMap[date.year] ?? -1;
  }

  void _generateYears() {
    years = List.generate(
      maxDate.year - minDate.year + 1,
      (index) => DateTime(minDate.year + index),
    );
    yearIndexMap = {
      for (int i = 0; i < years.length; i++) years[i].year: i,
    };
  }

  List<DateTime> getMonthsForYear(DateTime year) {
    return List.generate(12, (index) => DateTime(year.year, index + 1));
  }

  /// Jump to the DateTime.now() year
  void jumpToYear(DateTime date) async {
    final index = indexOfYear(date);
    if (index != -1) {
      itemScrollController.scrollTo(
        index: index * 2,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
