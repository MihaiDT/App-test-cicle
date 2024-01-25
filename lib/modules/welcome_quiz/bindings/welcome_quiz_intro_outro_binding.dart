import 'package:get/get.dart';
import 'package:lines/modules/welcome_quiz/controllers/welcome_quiz_intro_outro_controller.dart';

class WelcomeQuizIntroOutroBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WelcomeQuizIntroOutroController());
  }
}
