import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/calendar_data.dart';
import 'package:lines/data/models/current_period.dart';
import 'package:lines/data/models/period_status.dart';
import 'package:lines/data/models/symptom_category.dart';
import 'package:lines/data/models/symptom_diaries.dart';

class CalendarService {
  static Future<void> fetchCurrentPeriod() async {
    appController.currentPeriod.responseHandler = ResponseHandler.pending();

    try {
      final response = await dio.get(
        "/periods/current_period",
      );

      appController.currentPeriod.responseHandler = ResponseHandler.successful(
        content: CurrentPeriod.fromJson(
          response.data,
        ),
      );
    } catch (e) {
      appController.currentPeriod.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> fetchCalendarData() async {
    appController.calendarData.responseHandler = ResponseHandler.pending();

    try {
      final response = await dio.get(
        "/periods",
      );

      _saveCalendarData(response);
    } catch (e) {
      appController.calendarData.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> updateCalendarData(
    List<String> addedDates,
    List<String> removedDates,
  ) async {
    appController.calendarData.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/periods",
        data: {
          "dates": addedDates,
          "delete_dates": removedDates,
        },
      );

      _saveCalendarData(response);
    } catch (e) {
      appController.calendarData.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<Map<String, PeriodStatus>> fetchPeriods() async {
    try {
      final response = await dio.get(
        "/periods",
      );

      return _periodsCallback(response);
    } catch (e) {
      log.logApiException(e);
      return {};
    }
  }

  static Future<void> saveSymptomsForSpecificDate(
    SymptomDiaries symptomsDiaries,
  ) async {
    appController.symptomsDiaries.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/symptoms_diaries/${symptomsDiaries.date}",
        data: {
          "symptom_ids": symptomsDiaries.symptomsIDs,
          "hours_of_sleep": symptomsDiaries.hoursOfSleep,
          "notes": symptomsDiaries.notes,
          "water_lt": symptomsDiaries.waterLiters,
          "weight": symptomsDiaries.weight,
        },
      );
      _saveSymptomsDiaries(response);
    } catch (e) {
      log.logApiException(e);
      appController.symptomsDiaries.responseHandler = ResponseHandler.failed();
    }
  }

  static Future<void> fetchSymptomsForSpecificDate(
    DateTime dateTime,
  ) async {
    appController.symptomsDiaries.responseHandler = ResponseHandler.pending();
    String parsedDate = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    try {
      final response = await dio.get(
        "/symptoms_diaries/$parsedDate",
      );
      _saveSymptomsDiaries(response);
    } catch (e) {
      log.logApiException(e);
      appController.symptomsDiaries.responseHandler = ResponseHandler.failed();
    }
  }

  static Future<void> get symptomCategories async {
    try {
      appController.symptomCategory.responseHandler = ResponseHandler.pending();
      final response = await dio.get(
        "/symptoms_categories",
      );
      _saveSymptomsCategories(response);
    } catch (e) {
      appController.symptomCategory.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<Map<String, PeriodStatus>> saveDates(
    SaveDatesParameter parameter,
  ) async {
    try {
      final response = await dio.post(
        "/periods",
        data: {
          "dates": parameter.dates,
          "delete_dates": parameter.deletedDates,
        },
      );
      return _periodsCallback(response);
    } catch (e) {
      log.logApiException(e);
      return {};
    }
  }

  static Future<void> get homePageSymptomCategories async {
    appController.categoriesSavedInHome.responseHandler =
        ResponseHandler.pending();
    try {
      final response = await dio.get(
        "/symptoms_categories/homepage",
      );

      _saveSymptomCategoriesInHome(response);
    } catch (e) {
      appController.categoriesSavedInHome.responseHandler =
          ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> setHomePageSymptomCategories(List<String> ids) async {
    appController.categoriesSavedInHome.responseHandler =
        ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/symptoms_categories/homepage",
        data: {
          "symptoms_category_ids": ids,
        },
      );
      _saveSymptomCategoriesInHome(response);
    } catch (e) {
      appController.categoriesSavedInHome.responseHandler =
          ResponseHandler.failed();

      log.logApiException(e);
    }
  }

  static Map<String, PeriodStatus> _periodsCallback(Response response) {
    Map<String, PeriodStatus> result = {};
    List<Map<String, dynamic>> list =
        List<Map<String, dynamic>>.from(response.data['dates']);

    for (Map<String, dynamic> entry in list) {
      result[entry['date']] = PeriodStatus.fromJson(entry);
    }

    return result;
  }

  static void _saveSymptomsCategories(Response response) {
    appController.symptomCategory.responseHandler = ResponseHandler.successful(
      content: (response.data["symptoms_categories"] as List)
          .map(
            (e) => SymptomCategory.fromJson(e),
          )
          .toList(),
    );
  }

  static void _saveSymptomCategoriesInHome(Response response) {
    appController.categoriesSavedInHome.responseHandler =
        ResponseHandler.successful(
      content: (response.data["symptoms_categories"] as List)
          .map(
            (e) => SymptomCategory.fromJson(e),
          )
          .toList(),
    );
  }

  static void _saveCalendarData(Response response) {
    appController.calendarData.responseHandler = ResponseHandler.successful(
      content: NewCalendarData.fromJson(
        response.data,
      ),
    );
  }

  static void _saveSymptomsDiaries(Response response) {
    appController.symptomsDiaries.responseHandler = ResponseHandler.successful(
      content: SymptomDiaries.fromJson(
        response.data["symptoms_diary"],
      ),
    );
  }
}

class SaveDatesParameter {
  final List<String> dates;
  final List<String> deletedDates;

  SaveDatesParameter({
    this.dates = const <String>[],
    this.deletedDates = const <String>[],
  });
}
