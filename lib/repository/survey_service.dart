import 'package:dio/dio.dart';
import 'package:lines/core/utils/response_handler.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/answer.dart';
import 'package:lines/data/models/question.dart';
import 'package:lines/data/models/survey.dart';
import 'package:lines/data/models/survey_manager.dart';

class SurveyService {
  /// Fetch the first [Question] and the [Survey]
  static Future<void> fetchWelcomeQuiz() async {
    try {
      appController.question.responseHandler = ResponseHandler.pending();
      final response = await dio.get(
        "/surveys/welcome_quiz",
      );

      _saveSurvey(response);
      _saveQuestion(response);
    } catch (e) {
      appController.question.responseHandler = ResponseHandler.failed();
      appController.survey.responseHandler = ResponseHandler.failed();
    }
  }

  /// Fetch the next [Question] for the current [Survey]
  static Future<void> fetchNextQuestion(
    Survey survey,
    List<Answers> answers,
    Question question,
  ) async {
    try {
      appController.question.responseHandler = ResponseHandler.pending();

      final String surveyId = survey.id;
      List<String> answerIds = [];
      for (final Answers answer in answers) {
        answerIds.add(answer.id);
      }
      final response = await dio.post(
        "/surveys/$surveyId/answer",
        data: {
          "answer_ids": answerIds,
          "question_id": question.id,
        },
      );

      _saveSurvey(response);
      _saveQuestion(response);
    } catch (e) {
      appController.survey.responseHandler = ResponseHandler.failed();
    }
  }

  /// Save Question and Answer Objects in the state
  static void _saveQuestion(Response response) {
    final surveyResponse = SurveyManager.fromJson(
      response.data,
    );
    appController.question.responseHandler = ResponseHandler.successful(
      content: surveyResponse.question,
    );
  }

  /// Save Survey Object in the state
  static void _saveSurvey(Response response) {
    final surveyResponse = SurveyManager.fromJson(
      response.data,
    );
    appController.survey.responseHandler = ResponseHandler.successful(
      content: surveyResponse.survey,
    );
  }
}
