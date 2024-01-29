import 'package:get/get.dart';
import 'package:lines/modules/confirm_email/confirm_email_controller.dart';

class ConfirmEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConfirmEmailController());
  }
}
