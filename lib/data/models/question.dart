import 'package:lines/data/models/answer.dart';

class Question {
  List<Answers>? answers;
  int? createdAt;
  String? description;
  String id;
  int maxAnswers;
  int minAnswers;
  int? position;
  String? question;
  String? typology;
  int? updatedAt;

  Question({
    this.answers,
    this.createdAt,
    this.description,
    required this.id,
    required this.maxAnswers,
    this.minAnswers = 1,
    this.position,
    this.question,
    this.typology,
    this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<Answers>? answersList;

    if (json['answers'] != null) {
      answersList = <Answers>[];
      json['answers'].forEach((v) {
        answersList?.add(Answers.fromJson(v));
      });
    }

    return Question(
      answers: answersList,
      createdAt: json['created_at'],
      description: json['description'],
      id: json['id'],
      maxAnswers: json['max_answers'],
      minAnswers: json['min_answers'],
      position: json['position'],
      question: json['question'],
      typology: json['typology'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['description'] = description;
    data['id'] = id;
    data['max_answers'] = maxAnswers;
    data['min_answers'] = minAnswers;
    data['position'] = position;
    data['question'] = question;
    data['typology'] = typology;
    data['updated_at'] = updatedAt;
    return data;
  }

  String get questionDescription {
    if (typology == 'tag') {
      // TODO: fare meglio...
      return "Scegli almeno tre argomenti\nche vorresti approfondire con My Lines";
    }

    if (minAnswers < maxAnswers) {
      return "Seleziona una o più opzioni";
    }
    return "";
  }
}
