import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';

class CalendarMonthYearSwitch extends StatelessWidget {
  final bool monthSelected;

  const CalendarMonthYearSwitch({this.monthSelected = true, super.key});

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
          _innerContainer('MESE', monthSelected),
          const SizedBox(
            width: 2,
          ),
          _innerContainer('ANNO', monthSelected == false),
        ],
      ),
    );
  }

  Widget _innerContainer(String text, bool selected) {
    return GestureDetector(
      onTap: () {
        //TODO: add onTap callback
      },
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
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
