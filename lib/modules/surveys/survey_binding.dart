import 'package:get/get.dart';
import 'package:lines/modules/surveys/survey_controller.dart';

class SurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyController>(() => SurveyController());
  }
}
