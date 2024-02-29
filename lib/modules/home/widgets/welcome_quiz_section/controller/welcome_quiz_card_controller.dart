import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class WelcomeQuizSectionController extends GetxController {
  int get coinAmount => appController.settings.value?.welcomeSurveyCoins ?? 150;
}
