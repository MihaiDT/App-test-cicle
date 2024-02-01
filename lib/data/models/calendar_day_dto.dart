import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/period_phase.dart';
import 'package:lines/data/models/period_status.dart';

class CalendarDayDTO {
  final Color bgColor;

  CalendarDayDTO({required this.bgColor});

  factory CalendarDayDTO.fromPeriodStatus(PeriodStatus periodStatus) {
    switch (periodStatus.periodPhase) {
      case PeriodPhase.menstruation:
        return CalendarDayDTO(bgColor: ThemeColor.cicloColor);
      default:
        return CalendarDayDTO(bgColor: Colors.transparent);
    }
  }

  @override
  String toString() {
    return 'CalendarDayDTO{bgColor: $bgColor}';
  }
}
