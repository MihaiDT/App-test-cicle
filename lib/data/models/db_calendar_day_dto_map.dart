import 'package:lines/data/models/symptom.dart';

class DBCalendarDayDtoMap {
  Map<String, List<Symptom>> symptomsDtoMap;

  DBCalendarDayDtoMap({
    required this.symptomsDtoMap,
  });

  factory DBCalendarDayDtoMap.fromDateTimeAsKey({
    required Map<DateTime, List<Symptom>> symptomsDtoMapWithDateTimeAsKey,
  }) {
    Map<String, List<Symptom>> symptomsDtoMap = {
      for (final entry in symptomsDtoMapWithDateTimeAsKey.entries)
        _normalizeDate(entry.key): entry.value,
    };

    return DBCalendarDayDtoMap(symptomsDtoMap: symptomsDtoMap);
  }

  static String _normalizeDate(DateTime dateTime) {
    return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  }
}
