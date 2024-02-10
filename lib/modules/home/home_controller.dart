// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/period_date.dart';
import 'package:lines/modules/home/widgets/horizontal_calendar/home_horizontal_calendar.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../../core/utils/helpers.dart';
import '../../widgets/layouts/app_scaffold_controller.dart';

class HomeController extends AppScaffoldController {
  // late final HomeHorizontalCalendarController horizontalCalendarController;
  RxInt counter = 0.obs;
  bool updating = false;
  final scrollSnapListKey = GlobalKey<ScrollSnapListState>();

  RxBool rxPlayButtonVisible = false.obs;
  bool get playButtonVisible => rxPlayButtonVisible.value;
  set playButtonVisible(bool newValue) => rxPlayButtonVisible.value = newValue;

  RxInt rxPeriodSelectedDateIndex = 0.obs;
  int get periodSelectedDateIndex => rxPeriodSelectedDateIndex.value;
  set periodSelectedDateIndex(int newValue) => rxPeriodSelectedDateIndex.value = newValue;

  Map<String, PeriodDate> get currentPeriodDatesMap => appController.currentPeriod.value?.dates ?? {};
  List<PeriodDate> get currentPeriodDates => appController.currentPeriod.value?.dates.values.toList() ?? [];

  @override
  void onInit() {
    super.onInit();
    _initCalendars();
  }

  horizontalCalendarOnItemFocus(int index) {
    periodSelectedDateIndex = index;

    playButtonVisible =
        false; // FIXME: dateFormatYMD.format(dates[periodSelectedDateIndex]) == dateFormatYMD.format(DateTime.now());
    // TODO: cambio immagine avatar e colore
  }

  DateTime get selectedDate {
    return dateFormatYMD.parse(currentPeriodDatesMap.values.toList()[periodSelectedDateIndex].date);
  }

  /// Private methods

  // _generateDates() {
  //   final DateTime today = DateTime.now();

  //   int dateMilliseconds = today.add(Duration(days: (-(7 * numberOfWeeksBefore) - 3))).millisecondsSinceEpoch;
  //   final lastDateMilliseconds = today.add(Duration(days: ((7 * numberOfWeeksAfter) + 4))).millisecondsSinceEpoch;

  //   while (dateMilliseconds <= lastDateMilliseconds) {
  //     dateMilliseconds = dateMilliseconds + const Duration(days: 1).inMilliseconds;
  //     dates.add(DateTime.fromMillisecondsSinceEpoch(dateMilliseconds));
  //   }
  // }

  _initCalendars() async {
    await CalendarService.fetchCurrentPeriod();

    Get.put(const HomeHorizontalCalendar());

    final formattedTodayDate = dateFormatYMD.format(DateTime.now());

    periodSelectedDateIndex = currentPeriodDatesMap.keys.toList().indexOf(formattedTodayDate);
    periodSelectedDateIndex =
        periodSelectedDateIndex < 0 ? currentPeriodDatesMap.keys.toList().length : periodSelectedDateIndex - 1;
  }
}
