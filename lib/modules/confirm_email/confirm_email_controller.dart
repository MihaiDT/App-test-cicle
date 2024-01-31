import 'package:get/get.dart';
import 'package:lines/app_controller.dart';

import '../../routes/routes.dart';

class ConfirmEmailController extends GetxController {
  late AppController appController;

  @override
  void onInit() {
    appController = Get.find<AppController>();
    super.onInit();
  }

  void logIn() {
    Get.toNamed(Routes.lastMensesPage);
  }
}
