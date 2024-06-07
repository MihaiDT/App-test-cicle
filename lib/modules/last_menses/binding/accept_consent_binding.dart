import 'package:get/get.dart';
import 'package:lines/modules/last_menses/controller/accept_consent_controller.dart';

class AcceptConsentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AcceptConsentController());
  }
}
