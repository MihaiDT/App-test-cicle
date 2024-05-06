import 'package:get/get.dart';
import 'package:lines/modules/confirm_tutor_email/confirm_tutor_email_controller.dart';

class ConfirmTutorEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ConfirmTutorEmailController(),
    );
  }
}
