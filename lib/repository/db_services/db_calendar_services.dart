import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/isar/symptom_calendar.dart';

class DBCalendarServices {
  static Map<String, SymptomCalendar> fetchSymptoms() {
    try {
      Map<String, SymptomCalendar> savedSymptoms = SymptomCalendar.findAll();
      return savedSymptoms;
    } catch (e) {
      // TODO: raise Sentry
      log.logError(e);

      return {};
    }
  }
}
