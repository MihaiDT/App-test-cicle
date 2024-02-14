import 'package:flutter/material.dart';
import 'package:lines/modules/calendar/widgets/calendar_year_column.dart';

class CalendarYearMonthsGrid extends StatelessWidget {
  final List<List<DateTime>> months;
  final Function(DateTime)? onMonthTapped;

  const CalendarYearMonthsGrid({
    required this.months,
    this.onMonthTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: months.length,
      itemBuilder: (context, rowIndex) => Row(
        children: List.generate(
          months[rowIndex].length,
          (monthIndex) => CalendarYearColumn(
            month: months[rowIndex][monthIndex],
            onMonthTapped: onMonthTapped,
          ),
        ),
      ),
    );
  }
}
