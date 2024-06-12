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
        return 'FASE\nMESTRUALE';
      case PeriodPhase.ovulation:
        return 'FASE\nOVULATORIA';
      case PeriodPhase.follicular:
        return 'FASE\nFOLLICOLARE';
      case PeriodPhase.luteal:
        return 'FASE\nLUTEALE';
      default:
        return '\nRITARDO';
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

  int get periodIndex {
    switch (this) {
      case PeriodPhase.menstruation:
        return 0;
      case PeriodPhase.ovulation:
        return 1;
      case PeriodPhase.follicular:
        return 2;
      case PeriodPhase.luteal:
        return 3;
      default:
        return -1;
    }
  }
}
