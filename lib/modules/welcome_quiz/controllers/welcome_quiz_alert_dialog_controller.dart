import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';

class WelcomeQuizAlertDialogController extends GetxController {
  /// Return the coin amount for the current survey fetched from settings
  int get coinAmount => appController.settings.value?.welcomeSurveyCoins ?? 150;

  void onContinueButtonPressed() {
    Get.back();
    Get.toNamed(Routes.welcomeQuizIntroPage);
  }
}
