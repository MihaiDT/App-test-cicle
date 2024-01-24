class Survey {
  int? adviceSurveyId;
  int? createdAt;
  String id;
  bool? isCompleted;
  String? userId;
  int? updatedAt;
  int completionPercentage;

  Survey({
    this.adviceSurveyId,
    this.createdAt,
    required this.id,
    this.isCompleted,
    this.userId,
    this.updatedAt,
    this.completionPercentage = 0,
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      adviceSurveyId: json['advice_survey_id'],
      createdAt: json['created_at'],
      id: json['id'],
      isCompleted: json['is_completed'],
      userId: json['user_id'],
      updatedAt: json['updated_at'],
      completionPercentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['advice_survey_id'] = adviceSurveyId;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['is_completed'] = isCompleted;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['percentage'] = completionPercentage;
    return data;
  }
}
