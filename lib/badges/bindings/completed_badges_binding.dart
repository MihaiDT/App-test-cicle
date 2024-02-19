import 'package:get/get.dart';
import 'package:lines/badges/controllers/completed_badges_controller.dart';

class CompletedBadgesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompletedBadgesController>(
      () => CompletedBadgesController(),
    );
  }
}
