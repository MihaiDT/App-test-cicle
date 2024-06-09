import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/menses_statistics.dart';
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
    } catch (e, s) {
      appController.periodsStats.responseHandler = ResponseHandler.failed();
      log.logApiException(e, s);
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
    } catch (e, s) {
      appController.specificDatePeriodsStats.responseHandler =
          ResponseHandler.failed();
      log.logApiException(e, s);
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
    } catch (e, s) {
      appController.symptomCategoryStats.responseHandler =
          ResponseHandler.failed();
      log.logApiException(e, s);
    }
  }

  static Future<void> getSymptomsCategoryStatistics(
    String symptomsCategoryId,
  ) async {
    try {
      appController.mensesStatistics.responseHandler =
          ResponseHandler.pending();
      final response = await dio.get(
        "/statistics/symptoms_category/$symptomsCategoryId",
      );
      _saveMensesStatistics(response);
    } catch (e, s) {
      appController.mensesStatistics.responseHandler = ResponseHandler.failed();
      log.logApiException(e, s);
    }
  }

  static void _saveStatisticPeriod(Response response) {
    List<Map<String, dynamic>> periodsData =
        List<Map<String, dynamic>>.from(response.data["period_stats"]);
    final periodsStats = List<PeriodsStats>.empty(growable: true);
    periodsStats.addAll(
      periodsData.asMap().entries.map(
        (periodEntry) {
          return PeriodsStats.fromJson(periodEntry.value);
        },
      ).toList(),
    );

    appController.periodsStats.responseHandler = ResponseHandler.successful(
      content: periodsStats,
    );
  }

  static void _saveStatisticPeriodForSpecificDate(Response response) {
    appController.specificDatePeriodsStats.responseHandler =
        ResponseHandler.successful(
      content: SpecificDatePeriodsStats.fromJson(response.data["period_stat"]),
    );
  }

  static void _saveSymptomCategoryStats(Response response) {
    appController.symptomCategoryStats.responseHandler =
        ResponseHandler.successful(
      content: SymptomCategoryStats.fromJson(response.data),
    );
  }

  static void _saveMensesStatistics(Response response) {
    appController.mensesStatistics.responseHandler = ResponseHandler.successful(
      content: (response.data['stat'] as List)
          .map(
            (e) => MensesStatistics.fromJson(e),
          )
          .toList(),
    );
  }
}
