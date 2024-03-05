import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lines/core/app_theme.dart';

import 'package:lines/modules/calendar/symptoms_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_chip.dart';

class CalendarBottomSheetRecap extends StatelessWidget {
  final SymptomsController symptomsController;

  const CalendarBottomSheetRecap({
    required this.symptomsController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleLarge(
            'RECAP DEL GIORNO',
            color: ThemeColor.brightPink,
          ),
          ThemeSizedBox.height8,
          Obx(
            () => Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(
                symptomsController.savedSymptoms.length,
                (index) => CalendarChip(
                  label: symptomsController.savedSymptoms[index].symptomName,
                  iconPath: symptomsController.savedSymptoms[index].iconPath,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
