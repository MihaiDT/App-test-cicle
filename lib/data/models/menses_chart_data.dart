class MensesChartData {
  final String label;
  final List<int> days;

  MensesChartData({
    required this.label,
    required this.days,
  });

  factory MensesChartData.fromJson(Map<String, dynamic> json) {
    return MensesChartData(
      label: json['label'],
      days: List<int>.from(json['days']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'days': days,
    };
  }

  @override
  String toString() {
    return 'MensesChartData{label: $label, days: $days}';
  }
}
