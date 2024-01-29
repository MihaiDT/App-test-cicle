import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';

class HowLongMensesController extends GetxController {
  int mensesDuration = 1;

  int howOftenMensesValue = 26;

  void onButtonPressed() {
    appController.updateUserParameters.periodDays = mensesDuration;
    appController.updateUserParameters.periodDuration = howOftenMensesValue;
    Get.toNamed(Routes.referral);
  }
}
