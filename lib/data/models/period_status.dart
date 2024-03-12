import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/period_phase.dart';

class PeriodStatus {
  final String date;
  final bool isReal;
  final PeriodPhase periodPhase;

  PeriodStatus({
    required this.date,
    required this.isReal,
    required this.periodPhase,
  });

  factory PeriodStatus.fromJson(Map<String, dynamic> data) {
    return PeriodStatus(
      date: data['date'],
      isReal: data['real'],
      periodPhase: PeriodPhase.fromString(data['period_phase'] as String),
    );
  }

  @override
  String toString() {
    return 'PeriodStatus{date: $date, real: $isReal, periodPhase: ${periodPhase.name}';
  }

  Color get bgColor => periodPhase == PeriodPhase.menstruation
      ? ThemeColor.menstruationColor
      : periodPhase == PeriodPhase.ovulation
          ? ThemeColor.ovulationColor
          : Colors.transparent;
}
