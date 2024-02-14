import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  ///return true if the year will have 366 days , false otherwise
  bool get isLeapYear {
    bool leapYear = false;
    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true) {
      return false;
    } else if (year % 4 == 0) {
      return true;
    }
    return leapYear;
  }

  ///return the DateTime of the first day of the following month (eg: 1-01-2024 => 1-02-2024)
  DateTime get toFirstDayOfNextMonth => DateTime(year, month + 1);

  ///return the DateTime of the following day (eg: 1-01-2024 => 2-01-2024)
  DateTime get nextDay => DateTime(year, month, day + 1);

  ///return true if other will come after the DateTime that calls this method
  bool isSameDayOrAfter(DateTime other) => isAfter(other) || isSameDay(other);

  ///return true if other will come before the DateTime that calls this method
  bool isSameDayOrBefore(DateTime other) => isBefore(other) || isSameDay(other);

  ///return true of other is the same date as the DateTime obj that calls this method
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool get isToday => isSameDay(DateTime.now());

  /// Returns the full name of the month for this [DateTime] object, formatted according to the current locale.
  /// This method uses the `DateFormat` class from the `intl` package to format the month
  /// into its full name. The locale code 'it' specifies Italian as the language,
  /// but you can replace it with any supported locale code to get the month name in that language.
  /// For example, calling this method on `DateTime(2024, 02, 14)` would return "Febbraio"
  /// for the Italian locale.
  String get formattedMonth => DateFormat('MMMM', 'it').format(this);
}
