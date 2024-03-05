import 'package:flutter/material.dart';

import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/data/enums/calendar_tabs.dart';

class CalendarMonthYearSwitch extends StatelessWidget {
  final CalendarTabs currentSelectedTab;
  final Function(CalendarTabs) onTabChanged;

  const CalendarMonthYearSwitch({
    super.key,
    required this.onTabChanged,
    required this.currentSelectedTab,
  });

  final BorderRadiusGeometry _borderRadiusGeometry =
      const BorderRadius.all(Radius.circular(40));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: _borderRadiusGeometry,
        color: ThemeColor.primaryOpaque,
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _innerContainer(
            'MESE',
            CalendarTabs.monthTab,
            currentSelectedTab == CalendarTabs.monthTab,
          ),
          const SizedBox(
            width: 2,
          ),
          _innerContainer(
            'ANNO',
            CalendarTabs.yearTab,
            currentSelectedTab == CalendarTabs.yearTab,
          ),
        ],
      ),
    );
  }

  Widget _innerContainer(String text, CalendarTabs tab, bool highlighted) {
    return GestureDetector(
      onTap: () {
        onTabChanged(tab);
      },
      child: Container(
        decoration: BoxDecoration(
          color: highlighted ? Colors.white : Colors.transparent,
          borderRadius: _borderRadiusGeometry,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 6,
        ),
        child: LabelLarge(
          text,
          color: ThemeColor.primary,
        ),
      ),
    );
  }
}
