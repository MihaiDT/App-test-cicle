import 'package:lines/data/models/period_status.dart';

class PeriodMap {
  final Map<String, PeriodStatus> dates;

  PeriodMap({
    required this.dates,
  });

  factory PeriodMap.fromJson(Map<String, dynamic> data) {
    Map<String, PeriodStatus> tempMap = {};
    List<Map<String, dynamic>> list =
        List<Map<String, dynamic>>.from(data['dates']);

    for (Map<String, dynamic> entry in list) {
      tempMap[entry['date']] = PeriodStatus.fromJson(entry);
    }

    return PeriodMap(dates: tempMap);
  }
}
