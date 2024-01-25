import 'package:dio/dio.dart';

import 'package:lines/core/helpers/log.dart';

import '../core/utils/response_handler.dart';
import '../core/utils/singletons.dart';
import '../data/models/period_map.dart';

class CalendarService {
  static Future<void> fetchPeriods() async {
    appController.periodMap.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.get(
        "/periods",
      );
      _savePeriods(response);
    } catch (e) {
      appController.periodMap.responseHandler = ResponseHandler.failed();
    }
  }

  static void _savePeriods(Response response) {
    appController.periodMap.responseHandler = ResponseHandler.successful(
      content: PeriodMap.fromJson(
        response.data,
      ),
    );
  }

  static Future<void> saveDates(SaveDatesParameter parameter) async {
    try {
      await dio.post(
        "/periods",
        data: {
          "dates": parameter.dates,
          "delete_dates": parameter.deletedDates,
        },
      );
    } catch (e) {
      logError(error: e);
    }
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
