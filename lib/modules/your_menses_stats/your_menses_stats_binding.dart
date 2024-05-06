import 'package:get/get.dart';
import 'package:lines/modules/your_menses_stats/your_menses_stats_controller.dart';

class YourMensesStatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YourMensesStatsController());
  }
}
