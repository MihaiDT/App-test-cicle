import 'package:get/get.dart';
import 'package:lines/modules/referral/referral_controller.dart';

class ReferralBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ReferralController());
  }
}
