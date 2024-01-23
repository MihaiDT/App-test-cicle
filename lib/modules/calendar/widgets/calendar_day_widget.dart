import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_gradient.dart';
import '../../../core/theme/theme_icon.dart';
import '../../../core/theme/theme_text_style.dart';

class CalendarDayWidget extends StatelessWidget {
  final DayStatus dayStatus;
  final bool isSelected;
  final bool isToday;
  final BoxConstraints parentConstraints;
  final String text;
  final double circleRadius;
  final EdgeInsets? padding;

  const CalendarDayWidget({
    this.circleRadius = 17.0,
    this.padding,
    required this.dayStatus,
    required this.isToday,
    required this.isSelected,
    required this.parentConstraints,
    required this.text,
    super.key,
  });

  double get _parentHeight => parentConstraints.maxHeight;

  @override
  Widget build(BuildContext context) {
    double iconYPos = _parentHeight - circleRadius;
    return Stack(
      alignment: Alignment.center,
      children: [
        _dayWrapper,
        Positioned(top: iconYPos + 2.5, child: _bottomIcon),
        Visibility(
          visible: isSelected,
          child: Container(
            width: circleRadius * 2 + 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: GradientBoxBorder(
                width: 2,
                gradient: ThemeGradient.primary,
              ),
            ),
          ),
        )
      ],
    );
  }

  Color get _bgColor {
    switch (dayStatus) {
      case DayStatus.filledBlue:
      case DayStatus.filledBlueDot:
      case DayStatus.filledBlueHeart:
        return ThemeColor.ovulazioneColor;
      case DayStatus.filledRed:
      case DayStatus.filledRedDot:
      case DayStatus.filledRedHeart:
        return ThemeColor.cicloColor;
      default:
        return Colors.transparent;
    }
  }

  Widget get _bottomIcon {
    switch (dayStatus) {
      case DayStatus.emptyHeart:
      case DayStatus.filledRedHeart:
      case DayStatus.filledBlueHeart:
        return SvgPicture.asset(ThemeIcon.calendarHeart);
      case DayStatus.emptyDot:
      case DayStatus.filledRedDot:
      case DayStatus.filledBlueDot:
        return SvgPicture.asset(ThemeIcon.calendarGradientDot);
      default:
        return const SizedBox();
    }
  }

  Widget get _dayWrapper {
    switch (dayStatus) {
      case DayStatus.dottedBlue:
      case DayStatus.dottedRed:
        return DottedBorder(
          borderType: BorderType.Circle,
          color: _dottedBorderColor,
          dashPattern: const [4],
          strokeWidth: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: circleRadius,
            child: FittedBox(child: _dayNumberText),
          ),
        );
      default:
        return CircleAvatar(
          backgroundColor: _bgColor,
          radius: circleRadius,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: FittedBox(child: _dayNumberText),
          ),
        );
    }
  }

  Widget get _dayNumberText {
    BuildContext? context = Get.context;
    switch (dayStatus) {
      case DayStatus.filledBlue:
      case DayStatus.filledBlueDot:
      case DayStatus.filledBlueHeart:
      case DayStatus.filledRed:
      case DayStatus.filledRedDot:
      case DayStatus.filledRedHeart:
        return BodyLarge(
          text,
          fontWeight: isToday
              ? NewThemeTextStyle.weightExtraBold
              : NewThemeTextStyle.weightMedium,
          textAlign: TextAlign.center,
        );
      default:
        return BodyLarge(
          text,
          fontWeight: isToday
              ? NewThemeTextStyle.weightExtraBold
              : NewThemeTextStyle.weightMedium,
          textAlign: TextAlign.center,
        ).applyShaders(context!);
    }
  }

  Color get _dottedBorderColor {
    switch (dayStatus) {
      case DayStatus.dottedRed:
        return ThemeColor.cicloColor;
      case DayStatus.dottedBlue:
        return ThemeColor.ovulazioneColor;
      default:
        return Colors.transparent;
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
