import 'package:get/get.dart';
import 'package:lines/modules/welcome_quiz/controllers/welcome_quiz_controller.dart';

class WelcomeQuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WelcomeQuizBodyController());
  }
}
