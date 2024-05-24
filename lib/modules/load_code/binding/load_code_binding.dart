import 'package:get/get.dart';
import 'package:lines/modules/load_code/controllers/load_code_controller.dart';

class LoadCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadCodeController>(() => LoadCodeController());
  }
}
