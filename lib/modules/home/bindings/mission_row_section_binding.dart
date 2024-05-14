import 'package:get/get.dart';
import 'package:lines/modules/home/controllers/mission_row_section_controller.dart';

class MissionRowSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MissionRowSectionController());
  }
}
