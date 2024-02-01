import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/period_phase.dart';
import 'package:lines/data/models/period_status.dart';

class CalendarDayDTO {
  final Color bgColor;
  final bool isReal;

  CalendarDayDTO({
    required this.bgColor,
    required this.isReal,
  });

  factory CalendarDayDTO.fromPeriodStatus(PeriodStatus periodStatus) {
    switch (periodStatus.periodPhase) {
      case PeriodPhase.menstruation:
        return CalendarDayDTO(
          bgColor: ThemeColor.cicloColor,
          isReal: periodStatus.real,
        );
      case PeriodPhase.ovulation:
        return CalendarDayDTO(
          bgColor: ThemeColor.ovulazioneColor,
          isReal: periodStatus.real,
        );
      default:
        return CalendarDayDTO(
          bgColor: Colors.transparent,
          isReal: periodStatus.real,
        );
    }
  }

  @override
  String toString() {
    return 'CalendarDayDTO{bgColor: $bgColor}';
  }
}
