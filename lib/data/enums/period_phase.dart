import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

enum PeriodPhase {
  follicular,
  luteal,
  menstruation,
  ovulation,
  noPhase;

  String get phaseLabel {
    switch (this) {
      case PeriodPhase.menstruation:
        return 'Mestruazioni';
      case PeriodPhase.ovulation:
        return 'Ovulazione';
      case PeriodPhase.follicular:
        return 'Folliculare';
      default:
        return 'Luteale';
    }
  }

  static PeriodPhase fromString(String value) {
    switch (value.toLowerCase()) {
      case 'menstruation':
        return PeriodPhase.menstruation;
      case 'ovulation':
        return PeriodPhase.ovulation;
      case 'follicular':
        return PeriodPhase.follicular;
      case 'luteal':
        return PeriodPhase.luteal;
      default:
        return PeriodPhase.noPhase;
    }
  }

  Color get periodColor {
    switch (this) {
      case PeriodPhase.menstruation:
        return ThemeColor.menstruationColor;
      case PeriodPhase.ovulation:
        return ThemeColor.ovulationColor;
      case PeriodPhase.follicular:
        return ThemeColor.follicularColor;
      case PeriodPhase.luteal:
        return ThemeColor.lutealColor;
      default:
        return ThemeColor.defaultPeriodColor;
    }
  }
}
