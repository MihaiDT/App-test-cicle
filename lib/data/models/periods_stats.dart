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
    final menstruationDaysList = List<int>.empty(growable: true);
    menstruationDaysList.addAll(
      List.from(
        json['period_phases']['menstruation_days'],
      ).asMap().entries.map((entry) => entry.value as int).toList(),
    );

    final ovulationDaysList = List<int>.empty(growable: true);
    ovulationDaysList.addAll(
      List.from(
        json['period_phases']['ovulation_days'],
      ).asMap().entries.map((entry) => entry.value as int).toList(),
    );

    return PeriodsStats(
      startingDate: json['from'],
      endingDate: json['to'],
      periodDuration: json['period_duration'],
      phasesCounter: json["phase_counters"] != null
          ? PhasesCounter.fromJson(json["phase_counters"])
          : null,
      menstruationDays: menstruationDaysList,
      ovulationDays: ovulationDaysList,
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
