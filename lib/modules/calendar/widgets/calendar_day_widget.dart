import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/single_day_data.dart';

class CalendarDayWidget extends StatelessWidget {
  final SingleDayData? singleDayData;

  final String? formattedDate;
  final bool isAnnualCalendar;

  final bool isSelected;

  const CalendarDayWidget({
    this.singleDayData,
    this.formattedDate,
    this.isAnnualCalendar = false,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _dayContainer(context),
        Visibility(
          visible: !isAnnualCalendar,
          child: Positioned(
            bottom: 4,
            child: _bottomIcon,
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

  Widget _dayContainer(BuildContext context) {
    if (singleDayData != null) {
      if (singleDayData!.isReal) {
        return CircleAvatar(
          backgroundColor: singleDayData?.periodPhase.periodColor,
          radius: circleRadius,
          child: Padding(
            padding:
                isAnnualCalendar ? const EdgeInsets.all(2.0) : EdgeInsets.zero,
            child: FittedBox(
              child: _dayNumberText(context),
            ),
          ),
        );
      } else if (singleDayData!.isReal == false) {
        return DottedBorder(
          borderType: BorderType.Circle,
          color: !singleDayData!.isTheoricalMensesDay &&
                  !singleDayData!.ovulationDay
              ? Colors.transparent
              : singleDayData!.periodPhase.periodColor,
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

  Widget _dayNumberText(
    BuildContext context,
  ) {
    return Text(
      text,
      style: isToday
          ? ThemeTextStyle.horizontalCalendarDate.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: textColor,
            )
          : ThemeTextStyle.horizontalCalendarDate.copyWith(
              color: textColor,
            ),
      textAlign: TextAlign.center,
    );
  }

  double get circleRadius => isAnnualCalendar ? 7.0 : 17.0;

  bool get isToday {
    final today = DateTime.now();
    final inputDate = DateFormat('yyyy-MM-dd').parse(formattedDate!);

    return inputDate.year == today.year &&
        inputDate.month == today.month &&
        inputDate.day == today.day;
  }

  Widget get _bottomIcon {
    if (singleDayData?.hasSex ?? false) {
      return SvgPicture.asset(ThemeIcon.calendarHeart);
    }
    if (singleDayData?.hasSymptoms ?? false) {
      return SvgPicture.asset(ThemeIcon.calendarGradientDot);
    }
    return const SizedBox.shrink();
  }

  Color? get textColor => singleDayData == null ||
          singleDayData?.periodPhase.periodColor == Colors.transparent ||
          singleDayData?.isReal == false
      ? ThemeColor.primary
      : Colors.white;

  String get text {
    String? day;

    if (formattedDate != null) {
      day = int.parse(formattedDate!.split('-').last).toString();
    }
    return singleDayData?.date.split('-').last ?? day ?? '';
  }
}
