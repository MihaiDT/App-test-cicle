import 'package:lines/data/models/period_date.dart';

class CurrentPeriod {
  final Map<String, PeriodDate> dates;

  CurrentPeriod({
    required this.dates,
  });

  factory CurrentPeriod.fromJson(Map<String, dynamic> json) {
    final Map<String, PeriodDate> dates = {};

    for (final jsonDate in json['dates']) {
      dates[jsonDate['date']] = PeriodDate.fromJson(jsonDate);
    }

    return CurrentPeriod(
      dates: dates,
    );
  }
}
