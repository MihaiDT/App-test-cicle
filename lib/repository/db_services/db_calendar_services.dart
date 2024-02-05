import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/db_calendar_day_dto_map.dart';
import 'package:lines/data/models/symptom.dart';

class DBCalendarServices {
  static Future<void> retrieveSymptoms() async {
    appController.dbCalendarDayDtoMap.responseHandler =
        ResponseHandler.pending();
    try {
      Map<DateTime, List<Symptom>> savedSymptoms =
          Map<DateTime, List<Symptom>>.from(
        HiveManager.savedSymptoms,
      );

      appController.dbCalendarDayDtoMap.responseHandler =
          ResponseHandler.successful(
        content: DBCalendarDayDtoMap.fromDateTimeAsKey(
          symptomsDtoMapWithDateTimeAsKey: savedSymptoms,
        ),
      );
    } catch (e) {
      log.logError(e);
      appController.dbCalendarDayDtoMap.responseHandler =
          ResponseHandler.failed();
    }
  }
}
