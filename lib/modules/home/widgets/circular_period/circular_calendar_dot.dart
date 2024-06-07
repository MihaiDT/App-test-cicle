import 'package:flutter/material.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/data/enums/period_phase.dart';
import 'package:lines/data/models/period_date.dart';

class CircularCalendarDot extends StatelessWidget {
  final int index;
  final PeriodDate periodDate;

  const CircularCalendarDot({
    super.key,
    required this.index,
    required this.periodDate,
  });

  @override
  Widget build(BuildContext context) {
    final today = dateFormatYMD.format(DateTime.now());

    EdgeInsets padding = EdgeInsets.all(periodDate.date == today ? 3.5 : 4.5);
    double size = 5;

    if (index == 0) {
      padding = EdgeInsets.all(periodDate.date == today ? 1 : 2);
      size = 12;
    } else if (periodDate.periodPhase == PeriodPhase.menstruation ||
        periodDate.isOvulationDay) {
      padding = EdgeInsets.all(periodDate.date == today ? 2.5 : 3.5);
      size = 8;
    }

    if (periodDate.date == today) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: padding,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: periodDate.periodPhase.periodColor,
                ),
                height: size,
                width: size,
              ),
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: periodDate.periodPhase.periodColor,
        ),
        height: size,
        width: size,
      ),
    );

    // final today = dateFormat.format(DateTime.now());
  }
}
