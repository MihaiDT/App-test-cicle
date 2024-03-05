import 'package:get/get.dart';

import 'package:lines/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashPageController(),
    );
  }
}
