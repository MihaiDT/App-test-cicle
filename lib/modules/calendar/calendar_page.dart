import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/app_theme.dart';
import '../../core/utils/helpers.dart';
import '../../widgets/layouts/app_scaffold_padding.dart';
import '../../widgets/layouts/app_scaffold_page.dart';
import 'calendar_controller.dart';

class CalendarPage extends GetView<CalendarController> {
  final size = Get.width * 0.7;
  CalendarPage({super.key});
  RxInt counter = 0.obs;

  bool updating = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgLight,
      body: AppScaffoldPadding(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: size,
                  width: size,
                  child: _circularCalendar(),
                ),
              ),
            ),
            Center(
              child: Obx(
                () => Text("${counter.value}"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _calendarDot({
    bool isBig = false,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      height: isBig ? 12 : 6,
      width: isBig ? 12 : 6,
    );
  }

  _panHandler(DragUpdateDetails d) {
    if (!updating) {
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
      double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp) ? yChange : yChange * -1;

      double horizontalRotation = (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

      // Total computed change
      double rotationalChange = verticalRotation + horizontalRotation;

      bool movingClockwise = rotationalChange > 0;
      bool movingCounterClockwise = rotationalChange < 0;

      // Now do something interesting with these computations!
      if (movingClockwise && rotationalChange > 0.3) {
        updating = true;
        HapticFeedback.lightImpact();
        counter.value += 1;

        // logDebug("--> $rotationalChange", tag: "Drag");

        _resetUpdating();
      } else if (rotationalChange < -0.3) {
        updating = true;
        HapticFeedback.lightImpact();
        counter.value -= 1;

        // logDebug("<-- $rotationalChange", tag: "Drag");
        _resetUpdating();
      }
    }
  }

  _resetUpdating() async {
    await wait(milliseconds: 100);
    updating = false;
  }

  Widget _circularCalendar() {
    const lightBlue = Color(0xff6DADD0);
    const follicolareColor = Color(0xff70B873);
    const orange = Color(0xffDC874A);
    const cicloColor = Color(0xffC62F3A);

    final List<Widget> children = [
      _calendarDot(color: cicloColor, isBig: true),
      _calendarDot(color: cicloColor, isBig: true),
      _calendarDot(color: cicloColor, isBig: true),
      _calendarDot(color: cicloColor, isBig: true),
      _calendarDot(color: cicloColor),
      _calendarDot(color: cicloColor),
      _calendarDot(color: follicolareColor),
      _calendarDot(color: follicolareColor),
      _calendarDot(color: follicolareColor),
      _calendarDot(color: follicolareColor),
      _calendarDot(color: follicolareColor),
      _calendarDot(color: lightBlue),
      _calendarDot(color: lightBlue),
      _calendarDot(color: lightBlue),
      _calendarDot(color: lightBlue),
      _calendarDot(color: lightBlue),
      _calendarDot(color: orange),
      _calendarDot(color: orange),
      _calendarDot(color: orange),
      _calendarDot(color: orange),
      _calendarDot(color: orange),
    ];
    final double distanceAngle = getDistanceAngle(28, children.length);

    return GestureDetector(
      onPanUpdate: _panHandler,
      child: Container(
        height: size * 2,
        width: size * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),

      // Stack(
      //   children: [
      //     RotationTransition(
      //       turns: const AlwaysStoppedAnimation((-4 / 36)),
      //       child: SizedBox(
      //         height: size,
      //         width: size,
      //         child: CustomPaint(
      //           foregroundPainter: CircularPathPainter(
      //             lineColor: Colors.transparent,
      //             completeColor: const Color(0xfff5f5f5).withOpacity(0.1),
      //             completePercent: 90,
      //             width: 16.0,
      //           ),
      //         ),
      //       ),
      //     ),

      //     /// Ciclo
      //     RotationTransition(
      //       turns: const AlwaysStoppedAnimation((-4 / 36)),
      //       child: SizedBox(
      //         height: size,
      //         width: size,
      //         child: CustomPaint(
      //           foregroundPainter: CircularPathPainter(
      //             lineColor: Colors.transparent,
      //             completeColor: const Color(0xfff5f5f5).withOpacity(0.2),
      //             completePercent: 25,
      //             width: 16.0,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );

    ///
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size boxSize = constraints.biggest;

        return Stack(
          children: List.generate(
            children.length,
            (index) => Align(
              alignment: Alignment(
                (cos(radians((-90 + (distanceAngle * index)))) * 1),
                (sin(radians((-90 + (distanceAngle * index)))) * 1),
              ),
              child: children[index],
            ),
          ),
        );
      },
    );
  }

  double getDistanceAngle(int? count, int? children) {
    return count == null ? (360 / children!) : (360 / count);
  }

  double getAngle(double halfWidth, double halfHeight, Offset position) {
    var x = position.dx - halfWidth;
    var y = position.dy - halfHeight;
    var angle = atan2(y, x);
    var degreeangle = angle * 180 / pi;
    return degreeangle;
  }

  double radians(double number) {
    return number * (pi / 180);
  }
}
