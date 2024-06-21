import 'package:get/get.dart';
import 'package:lines/modules/mission_completed/mission_completed_controller.dart';

class MissionCompletedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MissionCompletedController(),
    );
  }
}
