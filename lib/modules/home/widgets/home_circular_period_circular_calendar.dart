import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/app_theme.dart';
import '../../../core/utils/helpers.dart';
import '../../../widgets/calendars/circular_path_painter.dart';
import '../home_controller.dart';

class HomeCircularPeriodCircularCalendar extends GetView<HomeController> {
  static const follicolareColor = Color(0xff70B873);
  static const orange = Color(0xffDC874A);

  const HomeCircularPeriodCircularCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return _circularCalendar();
  }

  Widget _calendarDot({
    bool isBig = false,
    required Color color,
    int? index,
  }) {
    return Padding(
      padding: isBig ? const EdgeInsets.all(1) : const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: color,
        ),
        height: isBig ? 12 : 4,
        width: isBig ? 12 : 4,
        child: Center(
          child: SvgPicture.asset(ThemeIcon.drop, fit: BoxFit.scaleDown),
        ),
        // child: Center(child: Text("${index}", style: TextStyle(fontSize: 10))),
      ),
    );
  }

  Widget _circularCalendar() {
    final List<Widget> children = [];

    for (int i = 0; i < controller.dates.length; i++) {
      children.add(_calendarDot(
        color: ThemeColor.cicloColor,
        isBig: i % 26 == 0,
        index: controller.dates[i].day,
      ));
    }

    final datesLength = controller.dates.length -
        1; // + (controller.dates.length * 0.11).round() ;

    final double distanceAngle = _getDistanceAngle(datesLength);

    return GestureDetector(
      onPanUpdate: _panHandler,
      child: Obx(
        () => AnimatedRotation(
          duration: const Duration(milliseconds: 400),
          turns: -(controller.periodSelectedDateIndex / (datesLength * 1.15)),
          // Negativi perché se vado in avanti col calendario devo ruotare in senso antiorario con la corona circolare
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: size - 15,
                  width: size - 15,
                  child: CustomPaint(
                    foregroundPainter: CircularPathPainter(
                      lineColor: Colors.transparent,
                      completeColor: const Color(0xfff5f5f5).withOpacity(0.1),
                      completePercent: 88,
                      width: 16.0,
                    ),
                  ),
                ),
              ),

              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: size - 14,
                      width: size - 14,
                      child: CustomPaint(
                        foregroundPainter: CircularPathPainter(
                          lineColor: Colors.transparent,
                          completeColor: ThemeColor.primary.withOpacity(0.1),
                          completePercent: 86.5,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),

                  /// Arrow
                  Positioned(
                    top: (Get.width - size) / 2 - 8,
                    left: (Get.width - size) / 2 - 8,
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

              // /// Period
              // Obx(
              //   () => AnimatedRotation(
              //     turns: -controller.periodSelectedDateIndex / 43,
              //     duration: const Duration(milliseconds: 400),
              //     child: SizedBox(
              //       height: size,
              //       width: size,
              //       child: CustomPaint(
              //         foregroundPainter: CircularPathPainter(
              //           lineColor: Colors.transparent,
              //           completeColor: const Color(0xfff5f5f5).withOpacity(0.2),
              //           completePercent: 25, // FIXME: proporzioni
              //           width: 16.0,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              /// Dots
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  //     return Obx(
                  //       () => AnimatedRotation(
                  //         duration: const Duration(milliseconds: 400),
                  //         turns: -(controller.periodSelectedDateIndex /
                  //             datesLength), // Negativi perché se vado in avanti col calendario devo ruotare in senso antiorario con la corona circolare
                  //         child:
                  return Stack(
                    children: List.generate(
                      children.length,
                      (index) => Align(
                        alignment: Alignment(
                          (cos(_radians((-90 + (distanceAngle * index)))) * 1),
                          (sin(_radians((-90 + (distanceAngle * index)))) * 1),
                        ),
                        child: children[index],
                      ),
                    ),
                  );
                },
              ),

              /// Dot magnifier

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
    );
  }

  double _arrowAngle() {
    double xCoordinate = 0.1; // Coordinata x del punto sulla circonferenza
    double yCoordinate = 0.12; // Coordinata y del punto sulla circonferenza

    double rotationAngle = atan2(xCoordinate, yCoordinate);

    return -rotationAngle;
  }

  double _getAngle(double halfWidth, double halfHeight, Offset position) {
    var x = position.dx - halfWidth;
    var y = position.dy - halfHeight;
    var angle = atan2(y, x);
    var degreeangle = angle * 180 / pi;
    return degreeangle;
  }

  double _getDistanceAngle(int count) {
    return (360 * 0.85 / count);
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
      if (movingClockwise && rotationalChange > 0.3) {
        if (controller.periodSelectedDateIndex > 0) {
          controller.updating = true;
          HapticFeedback.lightImpact();

          await wait(milliseconds: 100);
          _resetUpdating();
          controller.scrollSnapListKey.currentState
              ?.focusToItem(controller.periodSelectedDateIndex -= 1);
        }
      } else if (rotationalChange < -0.3) {
        if (controller.periodSelectedDateIndex < controller.dates.length - 2) {
          controller.updating = true;
          HapticFeedback.lightImpact();

          await wait(milliseconds: 100);
          _resetUpdating();
          controller.scrollSnapListKey.currentState
              ?.focusToItem(controller.periodSelectedDateIndex += 1);
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
