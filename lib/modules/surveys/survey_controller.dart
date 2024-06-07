import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class SurveyController extends GetxController {
  bool get isWelcomeQuizCompleted =>
      appController.user.value?.isWelcomeQuizCompleted ?? false;

  int get welcomeQuizTotalCoins =>
      appController.settings.value?.welcomeSurveyCoins ?? 25;
}
