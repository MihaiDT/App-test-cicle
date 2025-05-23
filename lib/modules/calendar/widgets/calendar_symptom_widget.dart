import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/symptom.dart';

class CalendarSymptomWidget extends StatelessWidget {
  final Symptom symptom;
  final bool selected;
  final Function(String) saveSymptom;

  const CalendarSymptomWidget({
    required this.symptom,
    required this.selected,
    required this.saveSymptom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        saveSymptom(symptom.id);
      },
      child: Container(
        decoration: BoxDecoration(
          border: selected
              ? GradientBoxBorder(
                  gradient: ThemeGradient.primary,
                  width: 2,
                )
              : Border.all(
                  color: Colors.transparent,
                  width: 2,
                ),
          color: ThemeColor.opaqueWhite,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: 96,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              symptom.iconPath,
              width: 24,
              height: 24,
            ),
            ThemeSizedBox.height4,
            Flexible(
              child: LabelSmall(
                symptom.name,
                color: ThemeColor.darkBlue,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
