import 'package:lines/data/models/menses_chart_data.dart';

class SpecificDatePeriodsStats {
  final int periodDays;
  final String periodDaysLabel;
  final int periodDuration;
  final String periodDurationLabel;

  final List<MensesChartData> mensesChartData;

  SpecificDatePeriodsStats({
    required this.periodDays,
    required this.periodDaysLabel,
    required this.periodDuration,
    required this.periodDurationLabel,
    required this.mensesChartData,
  });

  factory SpecificDatePeriodsStats.fromJson(Map<String, dynamic> json) {
    return SpecificDatePeriodsStats(
      periodDays: json['period_days'],
      periodDaysLabel: json['period_days_label'],
      periodDuration: json['period_duration'],
      periodDurationLabel: json['period_duration_label'],
      mensesChartData: List<MensesChartData>.from(
        json['chart'].map((x) => MensesChartData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'period_days': periodDays,
      'period_days_label': periodDaysLabel,
      'period_duration': periodDuration,
      'period_duration_label': periodDurationLabel,
      'chart': mensesChartData.map((x) => x.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'SpecificDatePeriodsStats{periodDays: $periodDays, periodDaysLabel: $periodDaysLabel, periodDuration: $periodDuration, periodDurationLabel: $periodDurationLabel, mensesChartData: $mensesChartData}';
  }
}
