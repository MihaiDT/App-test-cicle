import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/period_phase.dart';
import 'package:lines/data/models/period_status.dart';
import 'package:lines/data/models/symptom.dart';

class CalendarDayDTO {
  final Color? bgColor;
  final bool? isReal;
  final List<Symptom> symptoms;

  CalendarDayDTO({
    this.bgColor,
    this.isReal,
    this.symptoms = const [],
  });

  factory CalendarDayDTO.fromPeriodStatus(PeriodStatus periodStatus) {
    switch (periodStatus.periodPhase) {
      case PeriodPhase.menstruation:
        return CalendarDayDTO(
          bgColor: ThemeColor.menstruationColor,
          isReal: periodStatus.real,
          symptoms: [],
        );
      case PeriodPhase.ovulation:
        return CalendarDayDTO(
          bgColor: ThemeColor.ovulationColor,
          isReal: periodStatus.real,
          symptoms: [],
        );
      default:
        return CalendarDayDTO(
          bgColor: Colors.transparent,
          isReal: periodStatus.real,
          symptoms: [],
        );
    }
  }

  @override
  String toString() {
    return 'CalendarDayDTO{bgColor: $bgColor}';
  }

  bool get hasSymptoms => symptoms.isNotEmpty;
}
