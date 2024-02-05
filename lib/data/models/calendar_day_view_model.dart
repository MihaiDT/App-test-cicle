import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/calendar_day_dto.dart';
import 'package:lines/data/models/calendar_day_dto_map.dart';
import 'package:lines/data/models/db_calendar_day_dto_map.dart';
import 'package:lines/data/models/symptom.dart';

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
    appController.calendarDayViewModel.responseHandler =
        ResponseHandler.pending();
    try {
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

      appController.calendarDayViewModel.responseHandler =
          ResponseHandler.successful(
        content: CalendarDayViewModel(
          symptomsDtoMap: symptomsDtoMap,
        ),
      );

      return CalendarDayViewModel(
        symptomsDtoMap: symptomsDtoMap,
      );
    } catch (e) {
      appController.calendarDayViewModel.responseHandler =
          ResponseHandler.failed();
      return CalendarDayViewModel(
        symptomsDtoMap: {},
      );
    }
  }

  void updateSymptomList(DateTime dateTime, List<Symptom> symptoms) {
    final String date = _normalizeDate(dateTime);
    Map<String, CalendarDayDTO> symptomsMap = symptomsDtoMap;
    symptomsMap[date] = CalendarDayDTO(
      bgColor: symptomsDtoMap[date]?.bgColor,
      isReal: symptomsDtoMap[date]?.isReal,
      symptoms: symptoms,
    );
    appController.calendarDayViewModel.responseHandler =
        ResponseHandler.successful(
      content: CalendarDayViewModel(
        symptomsDtoMap: symptomsMap,
      ),
    );
  }

  List<Symptom> getSymptomsForDay(DateTime dateTime) {
    final String date = _normalizeDate(dateTime);
    return symptomsDtoMap[date]?.symptoms ?? [];
  }

  String _normalizeDate(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }
}
