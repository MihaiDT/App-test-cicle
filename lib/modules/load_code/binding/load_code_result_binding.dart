import 'package:get/get.dart';
import 'package:lines/modules/load_code/controllers/load_code_result_controller.dart';

class LoadCodeResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadCodeResultController>(() => LoadCodeResultController());
  }
}
