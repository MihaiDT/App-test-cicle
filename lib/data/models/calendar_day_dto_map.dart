import 'package:lines/data/models/calendar_day_dto.dart';
import 'package:lines/data/models/period_status.dart';

class CalendarDayDTOMap {
  final Map<String, CalendarDayDTO> days;

  CalendarDayDTOMap._({
    required this.days,
  });

  factory CalendarDayDTOMap.fromJSON(Map<String, dynamic> data) {
    Map<String, CalendarDayDTO> map = {};
    List<Map<String, dynamic>> list =
        List<Map<String, dynamic>>.from(data['dates']);
    for (Map<String, dynamic> entry in list) {
      map[entry['date']] =
          CalendarDayDTO.fromPeriodStatus(PeriodStatus.fromJson(entry));
    }

    return CalendarDayDTOMap._(days: map);
  }
}
