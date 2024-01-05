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
}
