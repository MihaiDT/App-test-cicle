import 'package:get/get.dart';
import 'package:lines/core/helpers/logger/log.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/answer.dart';
import 'package:lines/data/models/question.dart';
import 'package:lines/repository/survey_service.dart';
import 'package:lines/routes/routes.dart';

class GameQuizController extends GetxController {
  List<Answers> answers = [];

  final RxList<Answers> selectedAnswers = <Answers>[].obs;

  GameQuizController() {
    _initSurvey();
  }

  Future<void> _initSurvey() async {
    await SurveyService.fetchChangePadQuiz();

    if (appController.question.responseHandler.isSuccessful &&
        appController.question.value != null) {
      answers = appController.question.value?.answers ?? [];
    }
  }

  bool get isRefreshing => appController.question.responseHandler.isPending;

  void onAnswerTap(Answers answer) {
    try {
      SurveyService.fetchNextQuestion(
        appController.survey.value!,
        [answer],
        appController.question.value!,
      );
    } catch (e) {
      logError(error: e);
    }
    Get.back();
  }
}
