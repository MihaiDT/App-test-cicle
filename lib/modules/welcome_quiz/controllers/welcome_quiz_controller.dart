import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/answer.dart';
import 'package:lines/data/models/question.dart';
import 'package:lines/repository/survey_service.dart';
import 'package:lines/routes/routes.dart';

class WelcomeQuizController extends GetxController {
  List<Answers> answers = [];
  late Question question;

  final RxList<Answers> selectedAnswers = <Answers>[].obs;

  @override
  void onInit() {
    if (appController.question.responseHandler.isSuccessful &&
        appController.question.value != null) {
      answers = appController.question.value?.answers ?? [];
      question = appController.question.value!;
    }
    super.onInit();
  }

  bool get isRefreshing => appController.question.responseHandler.isPending;

  bool get canProceed {
    if (appController.question.value != null) {
      return selectedAnswers.length >= appController.question.value!.minAnswers;
    }
    return true;
  }

  bool get questionHasDescription {
    return question.questionDescription.isNotEmpty == true;
  }

  bool get pageShouldRefresh {
    return appController.question.responseHandler.isSuccessful ||
        answers.isNotEmpty == true;
  }

  void onPressed() async {
    /// Exit the quiz if the user has completed it
    /// Fetch the next question
    await SurveyService.fetchNextQuestion(
      appController.survey.value!,
      selectedAnswers,
      appController.question.value!,
    );
    if (appController.survey.value?.isCompleted ?? false) {
      Get.toNamed(Routes.welcomeQuizOutroPage);
    } else if (appController.question.value != null) {
      question = appController.question.value!;
      answers = appController.question.value?.answers ?? [];
      selectedAnswers.clear();
    }
  }

  void onAnswerTap(Answers answer) {
    if (appController.question.value?.maxAnswers == 1) {
      selectedAnswers.clear();
      addSelectedAnswers(answer);
    } else if (isAnswerSelected(answer)) {
      removeSelectedAnswer(answer);
    } else {
      addSelectedAnswers(answer);
    }
  }

  bool isAnswerSelected(Answers answer) {
    return selectedAnswers.contains(answer);
  }

  void addSelectedAnswers(Answers answer) {
    selectedAnswers.add(answer);
  }

  void removeSelectedAnswer(Answers answer) {
    selectedAnswers.remove(answer);
  }

  double get progressValue {
    return (appController.survey.value?.completionPercentage ?? 0) / 100;
  }
}
