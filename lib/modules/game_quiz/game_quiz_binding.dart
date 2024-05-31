import 'package:get/get.dart';
import 'package:lines/modules/game_quiz/game_quiz_controller.dart';

class GameQuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GameQuizController());
  }
}
