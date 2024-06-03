import 'package:get/get.dart';
import 'package:lines/modules/privacy_details/privacy_details_controller.dart';

class PrivacyDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrivacyDetailsController());
  }
}
