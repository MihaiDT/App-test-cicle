import 'package:lines/data/enums/period_phase.dart';

class PeriodDate {
  final String date;
  final bool isOvulationDay;
  final bool isReal;
  final PeriodPhase periodPhase;

  PeriodDate({
    required this.date,
    required this.isOvulationDay,
    required this.isReal,
    required this.periodPhase,
  });

  factory PeriodDate.fromJson(Map<String, dynamic> json) {
    return PeriodDate(
      date: json['date'],
      isOvulationDay: json['ovulation_day'] ?? false,
      isReal: json['real'] ?? false,
      periodPhase: PeriodPhase.fromString(json['period_phase'] as String),
    );
  }
}
