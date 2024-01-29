import 'package:get/get.dart';
import 'package:lines/modules/last_menses/controller/last_menses_controller.dart';

class LastMensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LastMensesController>(() => LastMensesController());
  }
}
