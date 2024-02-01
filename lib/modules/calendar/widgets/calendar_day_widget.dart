import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_gradient.dart';
import '../../../core/theme/theme_text_style.dart';
import '../../../data/models/calendar_day_dto.dart';

class CalendarDayWidget extends StatelessWidget {
  final bool isSelected;
  final bool isToday;
  final BoxConstraints parentConstraints;
  final String text;
  final bool isAnnualCalendar;
  final CalendarDayDTO? calendarDayDTO;

  const CalendarDayWidget({
    required this.isToday,
    required this.isSelected,
    required this.parentConstraints,
    required this.text,
    required this.calendarDayDTO,
    this.isAnnualCalendar = false,
    super.key,
  });

  double get _parentHeight => parentConstraints.maxHeight;

  @override
  Widget build(BuildContext context) {
    double circleRadius = isAnnualCalendar ? 7.0 : 17.0;
    double iconYPos = _parentHeight - circleRadius;
    return Stack(
      alignment: Alignment.center,
      children: [
        dayContainer(circleRadius, context),
        Visibility(
          visible: !isAnnualCalendar,
          child: Positioned(
            top: iconYPos + 2.5,
            child: const SizedBox
                .shrink(), //temporary keeping this widget for later use with db info
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
        )
      ],
    );
  }

  Widget dayContainer(double circleRadius, BuildContext context) {
    if (calendarDayDTO != null) {
      if (calendarDayDTO!.isReal) {
        return CircleAvatar(
          backgroundColor: calendarDayDTO != null
              ? calendarDayDTO!.bgColor
              : Colors.transparent,
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
          color: calendarDayDTO!.bgColor,
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
    if (calendarDayDTO == null ||
        calendarDayDTO!.bgColor == Colors.transparent ||
        !calendarDayDTO!.isReal) {
      return BodyLarge(
        text,
        fontWeight: isToday
            ? NewThemeTextStyle.weightExtraBold
            : NewThemeTextStyle.weightMedium,
        textAlign: TextAlign.center,
      ).applyShaders(context);
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

enum DayStatus {
  empty,
  emptyDot,
  emptyHeart,
  filledBlue,
  filledBlueDot,
  filledBlueHeart,
  filledRed,
  filledRedDot,
  filledRedHeart,
  dottedBlue,
  dottedRed,
}
