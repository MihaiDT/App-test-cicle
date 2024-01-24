import 'package:lines/data/models/question.dart';
import 'package:lines/data/models/survey.dart';

class SurveyManager {
  Question? question;
  Survey? survey;

  SurveyManager({this.question, this.survey});

  SurveyManager.fromJson(Map<String, dynamic> json) {
    question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
    survey = json['survey'] != null ? Survey.fromJson(json['survey']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (question != null) {
      data['question'] = question!.toJson();
    }
    if (survey != null) {
      data['survey'] = survey!.toJson();
    }
    return data;
  }
}
