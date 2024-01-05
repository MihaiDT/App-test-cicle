import 'package:lines/core/utils/date_time_extension.dart';

class DayValues {
  /// The current day in layout
  final DateTime day;

  /// The text (day)
  final String text;

  /// The first day in the row for each week
  final bool isFirstDayOfWeek;

  /// The last day in the row for each week, but just the item seven
  final bool isLastDayOfWeek;

  DayValues({
    required this.day,
    required this.text,
    required this.isFirstDayOfWeek,
    required this.isLastDayOfWeek,
  });

  bool get isToday => day.isToday;
}
