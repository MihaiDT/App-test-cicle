import 'package:lines/data/models/calendar_day_dto.dart';
import 'package:lines/data/models/calendar_day_dto_map.dart';
import 'package:lines/data/models/db_calendar_day_dto_map.dart';

class CalendarDayViewModel {
  final Map<String, CalendarDayDTO> symptomsDtoMap;

  CalendarDayViewModel({
    required this.symptomsDtoMap,
  });

  /// Create a Map with the date as key and a list of symptoms as value
  /// fetching and merging the data from the local database and the API
  factory CalendarDayViewModel.fromDBAndApi({
    DBCalendarDayDtoMap? dbCalendarDayDtoMap,
    CalendarDayDTOMap? calendarDayDTOMap,
  }) {
    Map<String, CalendarDayDTO> symptomsDtoMap = {};

    if (calendarDayDTOMap != null) {
      calendarDayDTOMap.days.forEach((key, value) {
        symptomsDtoMap[key] = value;
      });
    } else {
      symptomsDtoMap = {};
    }

    if (dbCalendarDayDtoMap != null) {
      dbCalendarDayDtoMap.symptomsDtoMap.forEach(
        (key, value) {
          if (symptomsDtoMap.containsKey(key)) {
            symptomsDtoMap[key] = CalendarDayDTO(
              bgColor: symptomsDtoMap[key]!.bgColor,
              isReal: symptomsDtoMap[key]!.isReal,
              symptoms: value,
            );
          } else {
            symptomsDtoMap[key] = CalendarDayDTO(
              symptoms: value,
            );
          }
        },
      );
    }

    print(symptomsDtoMap);
    print("object");
    // print all the list of symptoms
    symptomsDtoMap.forEach((key, value) {
      print("key: $key");
      print("value: ${value.symptoms}");
    });

    return CalendarDayViewModel(
      symptomsDtoMap: symptomsDtoMap,
    );
  }
}
