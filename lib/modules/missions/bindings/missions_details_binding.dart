import 'package:get/get.dart';
import 'package:lines/modules/missions/controllers/missions_details_controller.dart';

class MissionsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MissionsDetailsController(),
    );
  }
}
