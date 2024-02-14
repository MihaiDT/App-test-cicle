import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/data/models/symptom_category.dart';
import 'package:lines/modules/calendar/widgets/calendar_chip.dart';

class HistorySymptom extends StatelessWidget {
  final SymptomCategory symptomCategory;
  final List<Symptom> symptoms;

  const HistorySymptom({
    required this.symptomCategory,
    required this.symptoms,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          symptomCategory.categoryIconPath,
        ),
        ThemeSizedBox.width8,
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadlineSmall(
                symptomCategory.categoryTitle,
                color: ThemeColor.darkBlue,
              ),
              ThemeSizedBox.height4,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  symptoms.length,
                  (index) => CalendarChip(
                    label: symptoms[index].symptomName,
                    iconPath: symptoms[index].iconPath,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
