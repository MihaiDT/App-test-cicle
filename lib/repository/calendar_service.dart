import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/current_period.dart';
import 'package:lines/data/models/new_symptom_category.dart';
import 'package:lines/data/models/period_status.dart';

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
      appController.periodMap.responseHandler = ResponseHandler.failed();
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
            (e) => NewSymptomCategory.fromJson(e),
          )
          .toList(),
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
