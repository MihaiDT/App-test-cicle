import 'package:get/get.dart';
import 'package:lines/modules/missions/controllers/missions_controller.dart';

class MissionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MissionsController(),
    );
  }
}
