import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class SurveySectionController extends GetxController {
  bool get showWelcomeQuizCard =>
      appController.user.value?.isWelcomeQuizCompleted == false;

  int get welcomeQuizTotalCoins =>
      appController.settings.value?.welcomeSurveyCoins ?? 25;
}
