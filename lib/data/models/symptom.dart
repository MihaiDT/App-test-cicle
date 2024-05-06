class Symptom {
  final String id;
  final String code;
  final String name;
  final String iconName;
  final int position;

  Symptom({
    required this.id,
    required this.code,
    required this.name,
    required this.iconName,
    required this.position,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      iconName: json['icon_name'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'icon_name': iconName,
      'position': position,
    };
  }

  @override
  String toString() {
    return 'NewSymptom{id: $id, code: $code, name: $name, iconName: $iconName, position: $position}';
  }

  String get iconPath => 'assets/icons/symptoms/$iconName';
}
