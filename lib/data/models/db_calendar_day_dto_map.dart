import 'package:lines/data/isar/symptom_calendar.dart';

class DBCalendarDayDtoMap {
  Map<String, SymptomCalendar> symptomCalendarsDtoMap;

  DBCalendarDayDtoMap({
    required this.symptomCalendarsDtoMap,
  });

  // factory DBCalendarDayDtoMap.fromDateTimeAsKey({
  //   required Map<DateTime, List<Symptom>> symptomsDtoMapWithDateTimeAsKey,
  // }) {
  //   Map<String, List<Symptom>> symptomsDtoMap = {
  //     for (final entry in symptomsDtoMapWithDateTimeAsKey.entries) _normalizeDate(entry.key): entry.value,
  //   };

  //   return DBCalendarDayDtoMap(
  //     symptomsDtoMap: symptomsDtoMap,
  //   );
  // }

  // static String _normalizeDate(DateTime dateTime) {
  //   return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  // }
}
