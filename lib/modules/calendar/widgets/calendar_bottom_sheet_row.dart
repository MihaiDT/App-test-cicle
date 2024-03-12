// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/isar/symptom.dart';
import 'package:lines/data/isar/symptom_category.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_symptom_widget.dart';

class CalendarBottomSheetRow extends GetView<CalendarController> {
  final SymptomCategory category;
  final int categoryIndex;

  List<Symptom> get symptoms => category.symptoms.toList();

  const CalendarBottomSheetRow({
    required this.categoryIndex,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            category.symptoms.toList().length + 2,
            (symptomIndex) {
              //add left padding at the start of the list
              if (symptomIndex == 0) {
                return ThemeSizedBox.width12;
              }
              //add right padding at the end of the list
              if (symptomIndex == category.symptoms.toList().length + 2 - 1) {
                return ThemeSizedBox.width12;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: _symptomContainer(
                  category.symptoms.toList()[symptomIndex - 1],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _symptomContainer(Symptom symptom) {
    return Obx(
      () {
        return CalendarSymptomWidget(
          selected: controller.rxCurrentSymptoms.value
              .where(
                (item) => item.id == symptom.id,
              )
              .toList()
              .isNotEmpty,
          symptom: symptom,
        );
      },
    );
  }
}
