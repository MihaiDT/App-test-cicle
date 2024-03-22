import 'package:easy_sticky_header/easy_sticky_header.dart';
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

  final List<DateTime> years = [];

  @override
  void onInit() {
    super.onInit();
    _generateYears();
  }

  /// Returns the index of the year in the list
  int indexOfYear(DateTime date) {
    for (int i = 0; i < years.length; i++) {
      if (years[i].year == date.year) {
        return i;
      }
    }
    return -1;
  }

  void _generateYears() {
    DateTime currentYear = DateTime(minDate.year);
    years.add(currentYear);
    while (currentYear.year != maxDate.year) {
      currentYear = DateTime(currentYear.year + 1);
      years.add(currentYear);
    }
  }

  List<DateTime> getMonthsForYear(DateTime year) {
    List<DateTime> months = [];
    for (int i = 1; i <= 12; i++) {
      months.add(DateTime(year.year, i));
    }
    return months;
  }

  /// Jump to the DateTime.now() year
  void jumpToYear(DateTime date) async {
    itemScrollController.jumpTo(
      // the index is *2 because the listview has 2 items for each year
      index: indexOfYear(date) * 2,
    );
  }
}
