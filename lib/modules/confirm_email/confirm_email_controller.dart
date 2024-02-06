import 'package:get/get.dart';
import 'package:lines/app_controller.dart';
import 'package:lines/routes/routes.dart';

class ConfirmEmailController extends GetxController {
  late AppController appController;

  @override
  void onInit() {
    appController = Get.find<AppController>();
    super.onInit();
  }

  void logIn() {
    appController.isLoginFlow.value = true;
    Get.offAllNamed(Routes.login);
  }
}
