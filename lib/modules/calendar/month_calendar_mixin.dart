import 'package:lines/core/utils/helpers.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

mixin MonthCalendarMixin {
  /// The mininimum date to show
  late final DateTime minDate;

  /// The maximum date to show
  late final DateTime maxDate;

  /// First date of month for months between minDate and maxDate
  late final List<DateTime> months;

  final ItemScrollController monthCalendarItemScrollController =
      ItemScrollController();

  /// Add every month to list between minDate and maxDate
  void _generateMonths() {
    months = [];

    DateTime currentDate = DateTime(minDate.year, minDate.month);
    months.add(currentDate);
    while (!(currentDate.year == maxDate.year &&
        currentDate.month == maxDate.month)) {
      currentDate = DateTime(currentDate.year, currentDate.month + 1);
      months.add(currentDate);
    }
  }

  void initMonthCalendar() {
    final today = DateTime.now();
    minDate = today.subtract(
      const Duration(
        days: 720,
      ),
    ); // FIXME: Valutare se ha senso andare più indietro, data primo ciclo registrato
    maxDate = today.add(
      const Duration(
        days: 120,
      ),
    );

    _generateMonths();
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
      monthCalendarItemScrollController.jumpTo(index: month, alignment: 0.05);
    } catch (e) {
      logError(error: e);
    }
  }

  void onDayTapped(DateTime day);
}
