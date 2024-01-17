import 'package:get/get.dart';
import 'package:lines/modules/how_long_menses/controller/menses_duration_counter_controller.dart';

class MensesDurationCounterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MensesDurationCounterController());
  }
}
