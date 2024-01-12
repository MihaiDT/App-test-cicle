import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import '../../../data/models/symptom.dart';
import 'calendar_symptom_widget.dart';

class CalendarBottomSheetRow extends StatelessWidget {
  final int categoryIndex;
  final List<Symptom> symptomList;
  final Function(int, int)? onSymptomTap;

  const CalendarBottomSheetRow({
    required this.categoryIndex,
    required this.onSymptomTap,
    required this.symptomList,
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
            symptomList.length + 2,
            (symptomIndex) {
              //add left padding at the start of the list
              if (symptomIndex == 0) {
                return ThemeSizedBox.width12;
              }
              //add right padding at the end of the list
              if (symptomIndex == symptomList.length + 2 - 1) {
                return ThemeSizedBox.width12;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: _symptomContainer(symptomIndex - 1),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _symptomContainer(int symptomIndex) {
    return Obx(
      () => CalendarSymptomWidget(
        iconPath: symptomList[symptomIndex].iconPath,
        onTap: () {
          if (onSymptomTap != null) {
            onSymptomTap!(
              categoryIndex,
              symptomIndex,
            );
          }
        },
        selected: symptomList[symptomIndex].selected,
        symptomName: symptomList[symptomIndex].symptomName,
      ),
    );
  }
}
