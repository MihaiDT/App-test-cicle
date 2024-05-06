import 'package:get/get.dart';
import 'package:lines/modules/charts_and_statistics/charts_and_statistics_controller.dart';

class ChartsAndStatisticsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChartsAndStatisticsController());
  }
}
