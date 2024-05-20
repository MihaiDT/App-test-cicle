import 'package:get/get.dart';
import 'package:lines/modules/welcome_quiz/controllers/welcome_quiz_intro_controller.dart';

class WelcomeQuizIntroBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WelcomeQuizIntroController());
  }
}
