import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/modules/home/widgets/circular_period/circular_calendar_dot.dart';
import 'package:lines/modules/home/widgets/circular_period/circular_path_painter.dart';

class CircularCalendar extends GetView<HomeController> {
  static const follicolareColor = Color(0xff70B873);
  static const orange = Color(0xffDC874A);

  const CircularCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return _circularCalendar();
  }

  Widget _circularCalendar() {
    final List<Widget> children = [];

    int index = 0;
    for (final periodDate in controller.currentPeriodDatesMap.values) {
      children.add(
        CircularCalendarDot(
          index: index,
          periodDate: periodDate,
        ),
      );

      index += 1;
    }

    final datesLength = controller.currentPeriodDatesMap.length -
        1; // + (controller.currentPeriodDatesMap.length * 0.11).round() ;

    final double distanceAngle = _getDistanceAngle(datesLength);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onPanUpdate: _panHandler,
          child: Obx(
            () => AnimatedRotation(
              duration: const Duration(milliseconds: 400),
              turns:
                  -(controller.periodSelectedDateIndex / (datesLength * 1.15)),
              // Negativi perché se vado in avanti col calendario devo ruotare in senso antiorario con la corona circolare
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: size - 14.5,
                      width: size - 14.5,
                      child: CustomPaint(
                        foregroundPainter: CircularPathPainter(
                          lineColor: Colors.transparent,
                          completeColor:
                              const Color(0xfff5f5f5).withOpacity(0.1),
                          completePercent: 88.4,
                          width: 16.0,
                        ),
                      ),
                    ),
                  ),

                  Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          height: size - 14.5,
                          width: size - 14.5,
                          child: CustomPaint(
                            foregroundPainter: CircularPathPainter(
                              lineColor: Colors.transparent,
                              completeColor:
                                  ThemeColor.primary.withOpacity(0.1),
                              completePercent: 87,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),

                      /// Arrow
                      Positioned(
                        top: (Get.width - size) / 2 - 14,
                        left: (Get.width - size) / 2 - 3,
                        child: Transform.rotate(
                          angle: _arrowAngle(),
                          child: SvgPicture.asset(
                            ThemeIcon.circularCalendarArrow,
                            color: ThemeColor.primary.withOpacity(0.1),
                            fit: BoxFit.scaleDown,
                            width: 9,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Dots
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Stack(
                        children: List.generate(
                          children.length,
                          (index) => Align(
                            alignment: Alignment(
                              (cos(_radians((-90 + (distanceAngle * index)))) *
                                  1),
                              (sin(_radians((-90 + (distanceAngle * index)))) *
                                  1),
                            ),
                            child: children[index],
                          ),
                        ),
                      );
                    },
                  ),

                  /// Gesture Detector
                  Container(
                    height: size * 2,
                    width: size * 2,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _arrowAngle() {
    double xCoordinate = 0.12; // Coordinata x del punto sulla circonferenza
    double yCoordinate = 0.12; // Coordinata y del punto sulla circonferenza

    double rotationAngle = atan2(xCoordinate, yCoordinate);

    return -rotationAngle;
  }

  double _getDistanceAngle(int count) {
    return (360 * 0.87 / count);
  }

  _panHandler(DragUpdateDetails d) async {
    if (!controller.updating) {
      /// Pan location on the wheel
      bool onTop = d.localPosition.dy <= size / 2;
      bool onLeftSide = d.localPosition.dx <= size / 2;
      bool onRightSide = !onLeftSide;
      bool onBottom = !onTop;

      /// Pan movements
      bool panUp = d.delta.dy <= 0.0;
      bool panLeft = d.delta.dx <= 0.0;
      bool panRight = !panLeft;
      bool panDown = !panUp;

      /// Absoulte change on axis
      double yChange = d.delta.dy.abs();
      double xChange = d.delta.dx.abs();

      /// Directional change on wheel
      double verticalRotation =
          (onRightSide && panDown) || (onLeftSide && panUp)
              ? yChange
              : yChange * -1;

      double horizontalRotation =
          (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

      // Total computed change
      double rotationalChange = verticalRotation + horizontalRotation;

      bool movingClockwise = rotationalChange > 0;

      // Now do something interesting with these computations!
      if (movingClockwise && rotationalChange > 0.2) {
        if (controller.periodSelectedDateIndex > 0) {
          controller.updating = true;

          await wait(milliseconds: 100);
          _resetUpdating();
          controller.scrollSnapListKey.currentState
              ?.focusToItem(controller.periodSelectedDateIndex.value -= 1);
        }
      } else if (rotationalChange < -0.3) {
        if (controller.periodSelectedDateIndex <
            controller.currentPeriodDatesMap.length - 1) {
          controller.updating = true;

          await wait(milliseconds: 100);
          _resetUpdating();
          controller.scrollSnapListKey.currentState
              ?.focusToItem(controller.periodSelectedDateIndex.value += 1);
        }
      }
    }
  }

  double _radians(double number) {
    return number * (pi / 180);
  }

  _resetUpdating() async {
    controller.updating = false;
    await wait(milliseconds: 100);
  }

  double get size => Get.width * 0.74;
}
