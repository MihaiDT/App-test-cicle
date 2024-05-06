import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/periods_stats.dart';
import 'package:lines/data/models/specific_date_period_stats.dart';
import 'package:lines/repository/menses_service.dart';
import 'package:lines/routes/routes.dart';

class SpecificMensesStatsController extends GetxController {
  SpecificDatePeriodsStats? get specificDatePeriodsStats =>
      appController.specificDatePeriodsStats.value;
  final PeriodsStats arguments = Get.arguments;
  RxBool isPageLoading = true.obs;

  final List<FlSpot> chartSpots = [];

  @override
  void onInit() {
    super.onInit();

    ever(
      appController.specificDatePeriodsStats.rxValue,
      condition: () => Get.currentRoute == Routes.specificMensesStats,
      (callback) {
        if (callback.isSuccessful) {
          generateSpotChart();
          isPageLoading.value = false;
        } else {
          isPageLoading.value = true;
        }
      },
    );
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await MensesService.statisticPeriodFromDate(arguments.startingDate);
  }

  void generateSpotChart() {
    if (specificDatePeriodsStats != null) {
      addSpots("leggero", 1);
      addSpots("medio", 2);
      addSpots("abbondante", 3);
    }

    chartSpots.sort((a, b) => a.x.compareTo(b.x));
  }

  void addSpots(String label, double value) {
    specificDatePeriodsStats?.mensesChartData
        .firstWhere((element) => element.label.toLowerCase() == label)
        .days
        .forEach((element) {
      chartSpots.add(FlSpot(element.toDouble(), value));
    });
  }
}
