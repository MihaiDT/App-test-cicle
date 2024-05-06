import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/routes/routes.dart';

class ConfirmEmailController extends GetxController {
  void logIn() {
    if (appController.isLoginFlow.value == true) {
      Get.back();
    } else {
      appController.isLoginFlow.value = true;
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> sendNewEmail() async {
    await AuthenticationService.sendActivationLink(email);
  }

  String get email => appController.user.value?.email ?? '';
}
