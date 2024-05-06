import 'package:get/get.dart';
import 'package:lines/repository/authentication_service.dart';

class ConfirmTutorEmailController extends GetxController {
  final String? tutorEmail = Get.arguments;

  @override
  void onInit() {
    print("Tutor Email: $tutorEmail");
    super.onInit();
  }

  void sendEmail() async {
    await AuthenticationService.sendConsentsEmail(tutorEmail);
  }
}
