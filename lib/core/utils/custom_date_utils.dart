class CustomDateUtils {
  static List<String> get daysOfWeek {
    return ['L', 'M', 'M', 'G', 'V', 'S', 'D'];
  }

  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = [
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
    ];
    return daysInMonth[month - 1];
  }

  /// Get the DateTime object representing a specific day of the month based on its index.
  /// Parameters:
  /// - year: The year of the date.
  /// - month: The month of the date.
  /// - index: The index of the day within the month.
  /// - start: The starting index for the days of the week (e.g., 0 for Sunday, 1 for Monday).
  static DateTime getDayOfMonthFromIndex(
    int year,
    int month,
    int index,
    int start,
  ) {
    return DateTime(
      year,
      month,
      (index +
          1 -
          start), // Calculate the day of the month based on the provided index and start day.
    );
  }

  /// Calculate the starting day of the week for a given month and year.
  /// Parameters:
  /// - year: The year of the month.
  /// - month: The month for which to calculate the starting day.
  static int calculateStartDayOfWeek(int year, int month) {
    const int weekdayStart = DateTime.monday;
    // Calculate the position of the first day of the month within the week.
    int monthPositionStartDay = (weekdayStart -
            DateTime.daysPerWeek -
            DateTime(
              year,
              month,
            ).weekday)
        .abs();
    // Adjust the position if it's greater than the number of days in a week.
    monthPositionStartDay = monthPositionStartDay > DateTime.daysPerWeek
        ? monthPositionStartDay - DateTime.daysPerWeek
        : monthPositionStartDay;
    return monthPositionStartDay == 7 ? 0 : monthPositionStartDay;
  }
}
