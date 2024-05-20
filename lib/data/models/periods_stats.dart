import 'package:lines/data/models/phase_counters.dart';

class PeriodsStats {
  final String startingDate;
  final String? endingDate;
  final PhasesCounter? phasesCounter;
  final int periodDuration;
  final List<int> menstruationDays;
  final List<int> ovulationDays;

  PeriodsStats({
    required this.startingDate,
    this.endingDate,
    this.phasesCounter,
    required this.periodDuration,
    required this.menstruationDays,
    required this.ovulationDays,
  });

  factory PeriodsStats.fromJson(Map<String, dynamic> json) {
    return PeriodsStats(
      startingDate: json['from'],
      endingDate: json['to'],
      periodDuration: json['period_duration'],
      phasesCounter: PhasesCounter.fromJson(json["phase_counters"]),
      menstruationDays:
          (json['period_phases']['menstruation_days'] as List<dynamic>)
              .map((item) => item as int)
              .toList(),
      ovulationDays: (json['period_phases']['ovulation_days'] as List<dynamic>)
          .map((item) => item as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'starting_date': startingDate,
      'ending_date': endingDate,
      'period_duration': periodDuration,
      'menstruation_days': menstruationDays,
      'ovulation_days': ovulationDays,
    };
  }

  @override
  String toString() {
    return 'PeriodsStats{startingDate: $startingDate, endingDate: $endingDate, periodDuration: $periodDuration, menstruationDays: $menstruationDays, ovulationDays: $ovulationDays}';
  }
}
