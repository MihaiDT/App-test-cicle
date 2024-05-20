import 'package:get/get.dart';
import 'package:lines/modules/welcome_quiz/controllers/welcome_quiz_outro_controller.dart';

class WelcomeQuizOutroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeQuizOutroController());
  }
}
