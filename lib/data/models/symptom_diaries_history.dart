class SymptomDiariesHistory {
  final String date;
  final String categoryCode;
  final String categoryName;
  final int categoryPosition;
  final String symptomCode;
  final String symptomName;
  final int symptomPosition;

  SymptomDiariesHistory({
    required this.date,
    required this.categoryCode,
    required this.categoryName,
    required this.categoryPosition,
    required this.symptomCode,
    required this.symptomName,
    required this.symptomPosition,
  });

  factory SymptomDiariesHistory.fromJson(Map<String, dynamic> json) {
    return SymptomDiariesHistory(
      date: json['date'],
      categoryCode: json['cat_code'],
      categoryName: json['cat_name'],
      categoryPosition: json['cat_position'],
      symptomCode: json['sym_code'],
      symptomName: json['sym_name'],
      symptomPosition: json['sym_position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'cat_code': categoryCode,
      'cat_name': categoryName,
      'cat_position': categoryPosition,
      'sym_code': symptomCode,
      'sym_name': symptomName,
      'sym_position': symptomPosition,
    };
  }
}
