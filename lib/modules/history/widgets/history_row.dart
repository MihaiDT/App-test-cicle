import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/history/widgets/history_symptom.dart';

import '../../../data/models/symptom_category.dart';

class HistoryRow extends StatelessWidget {
  final DateTime day;

  const HistoryRow({
    required this.day,
    super.key,
  });

  //only for testing purpose
  static final List<SymptomCategory> _tmpList = [
    SymptomCategory.flussoMestrualeCategory,
    SymptomCategory.moodCategory,
  ];
  //only for testing purpose
  static final Color _dayColor = ThemeColor.menstruationColor;

  @override
  Widget build(BuildContext context) {
    String abbreviatedMonth = DateFormat.MMM('it').format(day).toUpperCase();
    return Row(
      children: [
        Column(
          children: [
            DisplayLarge(
              '${day.day}',
              color: _dayColor,
            ),
            LabelSmall(
              abbreviatedMonth,
              color: _dayColor,
            ),
          ],
        ),
        ThemeSizedBox.width16,
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ThemeColor.historyContainerBg,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: _tmpList.length,
              itemBuilder: (context, index) => HistorySymptom(
                symptomCategory: _tmpList[index],
                symptoms: _tmpList[index].symptoms,
              ),
              separatorBuilder: (context, index) => ThemeSizedBox.height8,
            ),
          ),
        ),
      ],
    );
  }
}
