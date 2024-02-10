import 'package:dio/dio.dart';
import 'package:lines/data/models/current_period.dart';

import '../core/utils/response_handler.dart';
import '../core/utils/singletons.dart';
import '../data/models/calendar_day_dto_map.dart';
import '../data/models/period_map.dart';

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

  static Future<void> fetchPeriods() async {
    appController.periodMap.responseHandler = ResponseHandler.pending();
    appController.calendarDayDTOMap.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.get(
        "/periods",
      );
      _savePeriods(response);
      _createDaysDTO(response);
    } catch (e) {
      appController.periodMap.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> saveDates(SaveDatesParameter parameter) async {
    appController.periodMap.responseHandler = ResponseHandler.pending();
    appController.calendarDayDTOMap.responseHandler = ResponseHandler.pending();
    try {
      final response = await dio.post(
        "/periods",
        data: {
          "dates": parameter.dates,
          "delete_dates": parameter.deletedDates,
        },
      );
      _savePeriods(response);
      _createDaysDTO(response);
    } catch (e) {
      appController.periodMap.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static void _savePeriods(Response response) {
    appController.periodMap.responseHandler = ResponseHandler.successful(
      content: PeriodMap.fromJson(
        response.data,
      ),
    );
  }

  static void _createDaysDTO(Response response) {
    appController.calendarDayDTOMap.responseHandler =
        ResponseHandler.successful(
      content: CalendarDayDTOMap.fromJSON(
        response.data,
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
