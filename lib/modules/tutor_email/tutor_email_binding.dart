import 'package:get/get.dart';
import 'package:lines/modules/tutor_email/tutor_email_controller.dart';

class TutorEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TutorEmailController>(() => TutorEmailController());
  }
}
