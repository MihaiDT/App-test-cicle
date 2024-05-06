class SingleCategoryStats {
  final String code;
  final String name;

  final String iconName;

  final bool enabled;

  SingleCategoryStats({
    required this.code,
    required this.name,
    required this.iconName,
    required this.enabled,
  });

  factory SingleCategoryStats.fromJson(
    Map<String, dynamic> json,
  ) {
    return SingleCategoryStats(
      code: json['symptom_category']['code'],
      name: json['symptom_category']['name'],
      iconName: json['symptom_category']['icon_name'],
      enabled: json['enabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'iconName': iconName,
      'enabled': enabled,
    };
  }

  String get iconPath => 'assets/icons/symptoms/$iconName';
}
