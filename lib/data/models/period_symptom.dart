// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/period_phase.dart';
import 'package:lines/data/isar/symptom.dart';
import 'package:lines/data/isar/symptom_category.dart';
import 'package:lines/data/models/period_status.dart';

class PeriodSymptom {
  final PeriodPhase? periodPhase;
  final bool isReal;
  final RxList<Symptom> symptoms;

  PeriodSymptom({
    required this.isReal,
    required this.symptoms,
    this.periodPhase,
  });

  factory PeriodSymptom.fromPeriodStatus(PeriodStatus periodStatus) {
    switch (periodStatus.periodPhase) {
      case PeriodPhase.menstruation:
        return PeriodSymptom(
          isReal: periodStatus.isReal,
          periodPhase: periodStatus.periodPhase,
          symptoms: RxList<Symptom>.from([]),
        );
      case PeriodPhase.ovulation:
        return PeriodSymptom(
          isReal: periodStatus.isReal,
          periodPhase: periodStatus.periodPhase,
          symptoms: RxList<Symptom>.from([]),
        );
      default:
        return PeriodSymptom(
          isReal: periodStatus.isReal,
          periodPhase: periodStatus.periodPhase,
          symptoms: RxList<Symptom>.from([]),
        );
    }
  }

  @override
  String toString() {
    return 'PeriodSymptom{bgColor: $bgColor}';
  }

  Color get bgColor => periodPhase == PeriodPhase.menstruation
      ? ThemeColor.menstruationColor
      : periodPhase == PeriodPhase.ovulation
          ? ThemeColor.ovulationColor
          : Colors.transparent;

  bool get hasSymptoms => symptoms.value.isNotEmpty;
  bool get hasSexualActivity => symptoms.value
      .toList()
      .where(
        (item) => item.category.value?.id == SymptomCategory.sexualActivityId,
      )
      .toList()
      .isNotEmpty;
}
