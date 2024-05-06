import 'package:get/get.dart';
import 'package:lines/modules/specific_menses_stats/specific_menses_stats_controller.dart';

class SpecificMensesStatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecificMensesStatsController>(
      () => SpecificMensesStatsController(),
    );
  }
}
