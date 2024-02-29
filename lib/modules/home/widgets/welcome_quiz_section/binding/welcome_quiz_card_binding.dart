import 'package:get/get.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/controller/welcome_quiz_card_controller.dart';

class WelcomeQuizCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeQuizSectionController>(
        () => WelcomeQuizSectionController());
  }
}
