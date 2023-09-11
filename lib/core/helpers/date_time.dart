import 'package:intl/intl.dart';

final dateFormatYMD = DateFormat('yyyy-MM-dd');

extension $DateTime on DateTime {
  bool get isUnderage =>
      (DateTime(DateTime.now().year, month, day).isAfter(DateTime.now())
          ? DateTime.now().year - year - 1
          : DateTime.now().year - year) <
      18;

  int get weekOfMonth {
    final firstDayOfTheMonth = DateTime(year, month, 1);
    int sum = firstDayOfTheMonth.weekday - 1 + day;
    if (sum % 7 == 0) {
      return sum ~/ 7;
    } else {
      return sum ~/ 7 + 1;
    }
  }

  int get weeksOfMonth {
    final lastDayOfTheMonth = DateTime(year, month + 1, 0);

    return lastDayOfTheMonth.weekOfMonth;
  }
}
