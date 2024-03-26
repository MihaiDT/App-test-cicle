import 'package:lines/data/models/new_symptom.dart';

class NewSymptomCategory {
  final String id;
  final String code;
  final String name;
  final String iconName;
  final int position;

  final List<NewSymptom> symptoms;

  NewSymptomCategory({
    required this.id,
    required this.code,
    required this.name,
    required this.iconName,
    required this.position,
    required this.symptoms,
  });

  factory NewSymptomCategory.fromJson(Map<String, dynamic> json) {
    return NewSymptomCategory(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      iconName: json['icon_name'],
      position: json['position'],
      symptoms: (json['symptoms'] as List)
          .map(
            (e) => NewSymptom.fromJson(e),
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
}
