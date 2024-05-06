import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/periods_stats.dart';
import 'package:lines/data/models/specific_date_period_stats.dart';
import 'package:lines/data/models/symtpom_category_stats.dart';

class MensesService {
  static Future<void> get statisticPeriod async {
    try {
      appController.periodsStats.responseHandler = ResponseHandler.pending();
      final response = await dio.get(
        "/statistics/period",
      );
      _saveStatisticPeriod(response);
    } catch (e) {
      appController.periodsStats.responseHandler = ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> statisticPeriodFromDate(String date) async {
    try {
      appController.specificDatePeriodsStats.responseHandler =
          ResponseHandler.pending();
      final response = await dio.get(
        "/statistics/period/$date",
      );
      _saveStatisticPeriodForSpecificDate(response);
    } catch (e) {
      appController.specificDatePeriodsStats.responseHandler =
          ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static Future<void> get mensesStatistics async {
    try {
      appController.symptomCategoryStats.responseHandler =
          ResponseHandler.pending();
      final response = await dio.get(
        "/statistics",
      );
      _saveSymptomCategoryStats(response);
    } catch (e) {
      appController.symptomCategoryStats.responseHandler =
          ResponseHandler.failed();
      log.logApiException(e);
    }
  }

  static void _saveStatisticPeriod(Response response) {
    List<dynamic> periodsData = response.data["periods"];
    List<PeriodsStats> periodsStats =
        periodsData.map((period) => PeriodsStats.fromJson(period)).toList();

    appController.periodsStats.responseHandler = ResponseHandler.successful(
      content: periodsStats,
    );
  }

  static void _saveStatisticPeriodForSpecificDate(Response response) {
    appController.specificDatePeriodsStats.responseHandler =
        ResponseHandler.successful(
      content: SpecificDatePeriodsStats.fromJson(response.data),
    );
  }

  static void _saveSymptomCategoryStats(Response response) {
    appController.symptomCategoryStats.responseHandler =
        ResponseHandler.successful(
      content: SymptomCategoryStats.fromJson(response.data),
    );
  }
}
