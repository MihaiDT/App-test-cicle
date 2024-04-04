import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/new_symptom_category.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_open_bottomsheet_button.dart';
import 'package:lines/modules/calendar/widgets/calendar_other_notes_widget.dart';
import 'package:lines/modules/calendar/widgets/new_calendar_symptom_widget.dart';

class NewCalendarBottomSheetRow extends GetView<CalendarController> {
  final NewSymptomCategory category;
  final Function(String) saveSymptom;

  const NewCalendarBottomSheetRow({
    required this.category,
    required this.saveSymptom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (category.symptoms.isNotEmpty)
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  category.symptoms.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: Obx(
                        () {
                          return NewCalendarSymptomWidget(
                            selected: controller.symptomIds.contains(
                              category.symptoms[index].id,
                            ),
                            symptom: category.symptoms[index],
                            saveSymptom: saveSymptom,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        if (category.code.toLowerCase() == "sonno") ...[
          ThemeSizedBox.height24,
          const LabelLarge(
            "ORE DI SONNO",
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.height8,
          Obx(
            () {
              return CalendarOpenBottomsheetButton(
                values: controller.oreDiSonnoValues,
                callback: (String newValue) {
                  controller.oreDiSonnoValue.value = newValue;
                },
                value: controller.oreDiSonnoValue.value,
              );
            },
          ),
        ],
        if (category.code.toLowerCase() == "peso") ...[
          ThemeSizedBox.height16,
          Obx(
            () {
              return CalendarOpenBottomsheetButton(
                values: controller.pesoValues,
                callback: (String newValue) {
                  controller.pesoValue.value = newValue;
                },
                value: controller.pesoValue.value,
              );
            },
          ),
        ],
        if (category.code.toLowerCase() == "acqua") ...[
          ThemeSizedBox.height16,
          Obx(
            () {
              return CalendarOpenBottomsheetButton(
                values: controller.quantitaAcquaValues,
                callback: (String newValue) {
                  controller.quantitaAcquaValue.value = newValue;
                },
                value: controller.quantitaAcquaValue.value,
              );
            },
          ),
        ],
        if (category.code.toLowerCase() == "altre_note") ...[
          ThemeSizedBox.height16,
          Obx(
            () {
              return CalendarOtherNotesWidget(
                initialValue: controller.notesInitialValue.value,
                onChanged: (value) {
                  controller.notesInitialValue.value = value;
                },
              );
            },
          ),
        ],
      ],
    );
  }
}
