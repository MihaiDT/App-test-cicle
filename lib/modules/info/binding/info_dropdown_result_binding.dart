import 'package:get/get.dart';
import 'package:lines/modules/info/controller/info_dropdown_result_controller.dart';

class InfoDropdownResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfoDropdownResultController());
  }
}
