class Answers {
  String answer;
  int? createdAt;
  String id;
  String? imageUrl;
  int? position;
  int? updatedAt;

  Answers({
    required this.answer,
    this.createdAt,
    required this.id,
    this.imageUrl,
    this.position,
    this.updatedAt,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
      answer: json['answer'],
      createdAt: json['created_at'],
      id: json['id'],
      imageUrl: json['image_url'],
      position: json['position'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['answer'] = answer;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['position'] = position;
    data['updated_at'] = updatedAt;
    return data;
  }
}
