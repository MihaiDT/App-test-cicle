import 'package:get/get.dart';
import 'package:lines/modules/change_tutor_email/change_tutor_email_controller.dart';

class ChangeTutorEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeTutorEmailController>(() => ChangeTutorEmailController());
  }
}
