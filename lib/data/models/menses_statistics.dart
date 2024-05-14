import 'package:lines/data/models/periods_stats.dart';
import 'package:lines/data/models/symptom.dart';

class MensesStatistics {
  final PeriodsStats periodsStats;
  final List<Symptom> symptom;

  MensesStatistics({
    required this.periodsStats,
    required this.symptom,
  });

  factory MensesStatistics.fromJson(Map<String, dynamic> json) {
    return MensesStatistics(
      periodsStats: PeriodsStats.fromJson(json),
      symptom: (json['symptoms'] as List)
          .map(
            (e) => Symptom.fromJson(e),
          )
          .toList(),
    );
  }
}
