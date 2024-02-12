import 'package:flutter/material.dart';
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
    EdgeInsets padding = const EdgeInsets.all(5);
    double size = 4;

    if (index == 0) {
      padding = const EdgeInsets.all(1);
      size = 14;
    } else if (periodDate.periodPhase == PeriodPhase.menstruation ||
        periodDate.isOvulationDay) {
      padding = const EdgeInsets.all(2);
      size = 10;
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
  }
}
