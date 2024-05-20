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
      iconName: json['icon_name'] ?? '',
      position: json['position'] ?? 0,
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Symptom &&
        other.id == id &&
        other.code == code &&
        other.name == name &&
        other.iconName == iconName &&
        other.position == position;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        name.hashCode ^
        iconName.hashCode ^
        position.hashCode;
  }
}
