import 'package:get/get.dart';
import 'package:lines/modules/privacy_and_conditions/privacy_and_contitions_controller.dart';

class PrivacyAndConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyAndConditionsController());
  }
}
