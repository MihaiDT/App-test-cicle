import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/calendar/widgets/calendar_chip.dart';

class HistoryRow extends StatelessWidget {
  final Map<String, dynamic> symptomDiary;
  final bool isMensesDay;

  const HistoryRow({
    required this.symptomDiary,
    required this.isMensesDay,
    super.key,
  });

  Widget get _symtompsByCategory {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: symptomDiary['symptomsCategories'].length,
      itemBuilder: (context, index) {
        final item = symptomDiary['symptomsCategories'][index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 18,
                  height: 18,
                  child: SvgPicture.asset(
                    "assets/icons/symptoms/${item['symptomsCategoryCode']}.svg",
                  ),
                ),
                ThemeSizedBox.width4,
                HeadlineSmall(
                  item['symptomsCategoryName'],
                  color: ThemeColor.darkBlue,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Wrap(
                children: List.from(item['symptoms'])
                    .asMap()
                    .entries
                    .map(
                      (symptom) => symptom.value['name'] == ''
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CalendarChip(
                                label: symptom.value['name'],
                                iconPath:
                                    "assets/icons/symptoms/${symptom.value['code']}.svg",
                              ),
                            ),
                    )
                    .toList(),
              ),
            ),
            ThemeSizedBox.height4,
          ],
        );
      },
      separatorBuilder: (context, index) => ThemeSizedBox.height8,
    );
  }

  Color get _dayColor =>
      isMensesDay ? ThemeColor.menstruationColor : ThemeColor.primary;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(symptomDiary['date']);
    String abbreviatedMonth = DateFormat.MMM('it').format(date).toUpperCase();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 44,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DisplayLarge(
                date.day.toString(),
                color: _dayColor,
              ),
              LabelSmall(
                abbreviatedMonth,
                color: _dayColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ThemeColor.historyContainerBg,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: _symtompsByCategory,
          ),
        ),
      ],
    );
  }
}
