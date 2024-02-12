import 'package:lines/data/models/period_date.dart';

class CurrentPeriod {
  final Map<String, PeriodDate> dates;
  final List<String> menstruationInfo;
  final List<String> ovulationInfo;

  CurrentPeriod({
    required this.dates,
    required this.menstruationInfo,
    required this.ovulationInfo,
  });

  factory CurrentPeriod.fromJson(Map<String, dynamic> json) {
    final Map<String, PeriodDate> dates = {};
    final List<String> menstruationInfo = [];
    final List<String> ovulationInfo = [];

    for (final jsonItem in json['dates']) {
      dates[jsonItem['date']] = PeriodDate.fromJson(jsonItem);
    }

    for (final jsonItem in json['menstruation_data'].values) {
      menstruationInfo.add(jsonItem);
    }
    for (final jsonItem in json['ovulation_data'].values) {
      ovulationInfo.add(jsonItem);
    }

    return CurrentPeriod(
      dates: dates,
      menstruationInfo: menstruationInfo,
      ovulationInfo: ovulationInfo,
    );
  }
}
