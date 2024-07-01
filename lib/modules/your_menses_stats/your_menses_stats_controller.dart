import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/periods_stats.dart';
import 'package:lines/repository/menses_service.dart';

class YourMensesStatsController extends GetxController {
  int? get periodDays => appController.user.value?.periodDays;

  int? get periodDuration => appController.user.value?.periodDuration;

  List<PeriodsStats> get periodsStats => appController.periodsStats.value ?? [];

  @override
  Future<void> onReady() async {
    super.onReady();
    await MensesService.statisticPeriod;
  }
}
