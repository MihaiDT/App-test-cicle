import 'package:get/get.dart';
import 'package:lines/modules/main/main_controller_v2.dart';

class MainBindingV2 extends Bindings {
  @override
  void dependencies() {
    Get.put(MainControllerV2());
  }
}
