import 'package:lines/data/models/single_symptom_statistics.dart';
import 'package:lines/data/models/symptom.dart';

class SymptomPeriodStatistics {
  final Symptom symptom;
  final List<SingleSymptomStatistic> singleSymptomStatistic;

  SymptomPeriodStatistics({
    required this.symptom,
    required this.singleSymptomStatistic,
  });

  factory SymptomPeriodStatistics.fromJson(Map<String, dynamic> json) {
    return SymptomPeriodStatistics(
      symptom: Symptom.fromJson(json),
      singleSymptomStatistic: (json['days'] as List)
          .map(
            (e) => SingleSymptomStatistic.fromJson(e),
          )
          .toList(),
    );
  }
}
