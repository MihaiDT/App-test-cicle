import 'package:get/get.dart';
import 'package:lines/modules/info/controller/info_controller.dart';

class InfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InfoController());
  }
}
