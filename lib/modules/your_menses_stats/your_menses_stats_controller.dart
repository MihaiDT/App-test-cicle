import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/periods_stats.dart';

class YourMensesStatsController extends GetxController {
  int? get periodDays => appController.user.value?.periodDays;

  int? get periodDuration => appController.user.value?.periodDuration;

  List<PeriodsStats> get periodsStats => appController.periodsStats.value ?? [];
}
