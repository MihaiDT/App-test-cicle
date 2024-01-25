import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class WelcomeQuizIntroOutroController extends GetxController {
  /// Return the coin amount for the current survey fetched from settings
  int get coinAmount => appController.settings.value?.welcomeSurveyCoins ?? 150;
}
