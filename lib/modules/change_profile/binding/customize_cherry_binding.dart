import 'package:get/get.dart';
import 'package:lines/modules/change_profile/controller/customize_cherry_controller.dart';

class CustomizeCherryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomizeCherryController>(() => CustomizeCherryController());
  }
}
