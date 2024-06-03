import 'package:get/get.dart';
import 'package:lines/modules/cookies_fingerprinting/cookies_fingerprinting_controller.dart';

class CookiesFingerprintingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CookiesFingerprintingController());
  }
}
