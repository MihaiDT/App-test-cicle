import 'package:lines/data/models/symptom.dart';

class SymptomCategory {
  final String id;
  final String code;
  final String name;
  final String iconName;
  final int position;

  final List<Symptom> symptoms;

  SymptomCategory({
    required this.id,
    required this.code,
    required this.name,
    required this.iconName,
    required this.position,
    required this.symptoms,
  });

  factory SymptomCategory.fromJson(Map<String, dynamic> json) {
    return SymptomCategory(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      iconName: json['icon_name'],
      position: json['position'],
      symptoms: (json['symptoms'] as List)
          .map(
            (e) => Symptom.fromJson(e),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'icon_name': iconName,
      'position': position,
      'symptoms': symptoms.map((e) => e.toJson()).toList(),
    };
  }

  String get iconPath => 'assets/icons/symptoms/$iconName';

  Symptom getSymptomsFromId(String id) {
    return symptoms.firstWhere((element) => element.id == id);
  }
}
