import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/isar/symptom_calendar.dart';
import 'package:lines/data/models/period_status.dart';

class CalendarDayWidget extends StatelessWidget {
  final String formattedDate;
  final bool isSelected;
  final bool isToday;
  final String text;
  final bool isAnnualCalendar;

  const CalendarDayWidget({
    required this.formattedDate,
    required this.isToday,
    required this.isSelected,
    required this.text,
    this.isAnnualCalendar = false,
    super.key,
  });

  PeriodStatus? get periodStatus =>
      (appController.periodStatusCalendar.value)?[formattedDate];

  SymptomCalendar? get symptomsCalendar =>
      (appController.symptomsCalendar.value)?[formattedDate];

  Widget get _bottomIcon {
    if (symptomsCalendar?.hasSexualActivity ?? false) {
      return SvgPicture.asset(ThemeIcon.calendarHeart);
    }
    if (symptomsCalendar?.hasSymptoms ?? false) {
      return SvgPicture.asset(ThemeIcon.calendarGradientDot);
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    double circleRadius = isAnnualCalendar ? 7.0 : 17.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        _dayContainer(circleRadius, context),
        Visibility(
          visible: !isAnnualCalendar,
          child: Positioned(
            bottom: 4,
            child:
                _bottomIcon, //temporary keeping this widget for later use with db info
          ),
        ),
        Visibility(
          visible: isSelected && !isAnnualCalendar,
          child: Container(
            width: circleRadius * 2 + 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: GradientBoxBorder(
                width: isAnnualCalendar ? 1 : 2,
                gradient: ThemeGradient.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dayContainer(double circleRadius, BuildContext context) {
    if (periodStatus != null) {
      if (periodStatus!.isReal) {
        return CircleAvatar(
          backgroundColor: periodStatus!.bgColor,
          radius: circleRadius,
          child: Padding(
            padding:
                isAnnualCalendar ? const EdgeInsets.all(2.0) : EdgeInsets.zero,
            child: FittedBox(
              child: _dayNumberText(context),
            ),
          ),
        );
      } else {
        return DottedBorder(
          borderType: BorderType.Circle,
          color: periodStatus!.bgColor,
          dashPattern: const [4],
          strokeWidth: isAnnualCalendar ? 1 : 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: circleRadius,
            child: FittedBox(
              child: _dayNumberText(context),
            ),
          ),
        );
      }
    }

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: circleRadius,
      child: Padding(
        padding: isAnnualCalendar ? const EdgeInsets.all(2.0) : EdgeInsets.zero,
        child: FittedBox(
          child: _dayNumberText(context),
        ),
      ),
    );
  }

  Widget _dayNumberText(BuildContext context) {
    if (periodStatus == null ||
        periodStatus!.bgColor == Colors.transparent ||
        !periodStatus!.isReal) {
      return BodyLarge(
        text,
        fontWeight: isToday
            ? NewThemeTextStyle.weightExtraBold
            : NewThemeTextStyle.weightMedium,
        textAlign: TextAlign.center,
        color: ThemeColor.primary,
      );
    } else {
      return BodyLarge(
        text,
        fontWeight: isToday
            ? NewThemeTextStyle.weightExtraBold
            : NewThemeTextStyle.weightMedium,
        textAlign: TextAlign.center,
      );
    }
  }
}
