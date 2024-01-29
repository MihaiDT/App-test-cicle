import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../core/helpers/log.dart';
import 'calendar_store.dart';

class CalendarScrollController extends GetxController {
  /// The mininimum date to show
  final DateTime minDate;

  /// The maximum date to show
  final DateTime maxDate;

  final int weekdayStart = DateTime.monday;

  final DateTime? focusDate;

  late int weekdayEnd;

  ItemScrollController itemScrollController;
  late CalendarStore calendarStore;

  CalendarScrollController({
    this.focusDate,
    required this.minDate,
    required this.maxDate,
    required this.itemScrollController,
  });

  List<DateTime> months = [];

  @override
  void onInit() {
    super.onInit();
    calendarStore = Get.put(CalendarStore());
    final x = weekdayStart - 1;
    weekdayEnd = x == 0 ? 7 : x;
    _generateMonths();
  }

  @override
  void onReady() {
    super.onReady();
    if (focusDate != null) {
      jumpToMonth(date: focusDate!);
    } else {
      jumpToMonth(date: DateTime.now());
    }
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

  void onDayTapped(DateTime day) {
    calendarStore.selectedDate = day;
  }

  void jumpToMonth({required DateTime date}) {
    if (!(date.year >= minDate.year &&
        (date.year > minDate.year || date.month >= minDate.month) &&
        date.year <= maxDate.year &&
        (date.year < maxDate.year || date.month <= maxDate.month))) {
      return;
    }
    int month = ((date.year - minDate.year) * 12) - minDate.month + date.month;

    try {
      itemScrollController.jumpTo(index: month, alignment: 0.05);
    } catch (e) {
      logError(error: e);
    }
  }
}
