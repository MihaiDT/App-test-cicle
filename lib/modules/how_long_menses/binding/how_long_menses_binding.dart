import 'package:get/get.dart';
import 'package:lines/modules/how_long_menses/controller/how_long_menses_controller.dart';

class HowLongMensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HowLongMensesController>(
      () => HowLongMensesController(),
    );
  }
}
