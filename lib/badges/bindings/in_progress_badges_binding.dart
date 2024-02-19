import 'package:get/get.dart';
import 'package:lines/badges/controllers/in_progress_badges_controller.dart';

class InProgressBadgesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InProgressBadgesController>(() => InProgressBadgesController());
  }
}
