import 'package:get/get.dart';
import 'package:lines/modules/profile/controllers/my_badges_controller.dart';

class MyBadgesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBadgesController>(() => MyBadgesController());
  }
}
