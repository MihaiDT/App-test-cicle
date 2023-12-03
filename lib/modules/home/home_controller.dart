import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../core/utils/helpers.dart';
import '../../widgets/layouts/app_scaffold_controller.dart';

class HomeController extends AppScaffoldController {
  // late final HomeHorizontalPeriodCalendarController horizontalCalendarController;

  final scrollSnapListKey = GlobalKey<ScrollSnapListState>();

  RxBool rxPlayButtonVisible = false.obs;
  bool get playButtonVisible => rxPlayButtonVisible.value;
  set playButtonVisible(bool newValue) => rxPlayButtonVisible.value = newValue;

  RxInt rxPeriodSelectedDateIndex = 0.obs;
  int get periodSelectedDateIndex => rxPeriodSelectedDateIndex.value;
  set periodSelectedDateIndex(int newValue) => rxPeriodSelectedDateIndex.value = newValue;

  final List<DateTime> dates = [];
  final int numberOfWeeksBefore = 3; // FIXME: da calcolare rispetto al ciclo
  final int numberOfWeeksAfter = 3; // FIXME: da calcolare rispetto al ciclo

  HomeController() {
    _initHorizontalCalendar();
  }

  horizontalCalendarOnItemFocus(int index) {
    periodSelectedDateIndex = index;

    playButtonVisible = dateFormatYMD.format(dates[periodSelectedDateIndex]) == dateFormatYMD.format(DateTime.now());
    // TODO: cambio immagine avatar e colore
  }

  DateTime get selectedDate {
    return dates[periodSelectedDateIndex];
  }

  /// Private methods

  _generateDates() {
    final DateTime today = DateTime.now();

    int dateMilliseconds = today.add(Duration(days: (-(7 * numberOfWeeksBefore) - 3))).millisecondsSinceEpoch;
    final lastDateMilliseconds = today.add(Duration(days: ((7 * numberOfWeeksAfter) + 4))).millisecondsSinceEpoch;

    while (dateMilliseconds <= lastDateMilliseconds) {
      dateMilliseconds = dateMilliseconds + const Duration(days: 1).inMilliseconds;
      dates.add(DateTime.fromMillisecondsSinceEpoch(dateMilliseconds));
    }
  }

  _initHorizontalCalendar() {
    // Get.put(HorizontalCalendarController());
    // horizontalCalendarController = Get.find<HorizontalCalendarController>();
    _generateDates();

    periodSelectedDateIndex = (7 * 3) + 2;
  }
}
