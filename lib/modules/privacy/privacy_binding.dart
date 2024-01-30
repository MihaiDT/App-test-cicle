import 'package:get/get.dart';
import 'package:lines/modules/privacy/controller/privacy_controller.dart';

class PrivacyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrivacyController());
  }
}
