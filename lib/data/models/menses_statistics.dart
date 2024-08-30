import 'package:lines/data/models/periods_stats.dart';
import 'package:lines/data/models/symptom_period_statistics.dart';

class MensesStatistics {
  final PeriodsStats periodsStats;
  final List<SymptomPeriodStatistics> symptomPeriodStatistics;

  MensesStatistics({
    required this.periodsStats,
    required this.symptomPeriodStatistics,
  });

  factory MensesStatistics.fromJson(Map<String, dynamic> json) {
    return MensesStatistics(
      periodsStats: PeriodsStats.fromJson(json),
      symptomPeriodStatistics: (json['symptoms'] as List)
          .map(
            (e) => SymptomPeriodStatistics.fromJson(e),
          )
          .toList(),
    );
  }

  @override
  String toString() {
    return 'MensesStatistics(periodsStats: $periodsStats, symptomPeriodStatistics: $symptomPeriodStatistics)';
  }
}
