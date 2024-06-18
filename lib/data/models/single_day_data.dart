import 'package:lines/data/enums/period_phase.dart';

class SingleDayData {
  final String date;
  final bool isReal;
  final bool hasSex;
  final bool hasSymptoms;
  final bool ovulationDay;
  final PeriodPhase periodPhase;

  SingleDayData({
    required this.date,
    required this.isReal,
    required this.hasSex,
    required this.hasSymptoms,
    required this.ovulationDay,
    required this.periodPhase,
  });

  factory SingleDayData.fromJson(Map<String, dynamic> json) {
    return SingleDayData(
      date: json['date'],
      isReal: json['real'],
      hasSex: json['has_sex'],
      hasSymptoms: json['has_symptoms'],
      ovulationDay: json['ovulation_day'],
      periodPhase: PeriodPhase.fromString(json['period_phase']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'real': isReal,
      'has_sex': hasSex,
      'has_symptoms': hasSymptoms,
      'ovulation_day': ovulationDay,
      'period_phase': periodPhase.toString(),
    };
  }

  @override
  String toString() {
    return 'NewSingleDayData{date: $date, isReal: $isReal, hasSex: $hasSex, hasSymptoms: $hasSymptoms, ovulationDay: $ovulationDay, periodPhase: $periodPhase}';
  }

  bool get isMensesDay => periodPhase == PeriodPhase.menstruation && isReal;

  bool get isTheoricalMensesDay =>
      periodPhase == PeriodPhase.menstruation && !isReal;
}
