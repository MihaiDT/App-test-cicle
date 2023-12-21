import 'package:flutter/material.dart';

class BottomWidgetLayout extends StatelessWidget {
  final ScrollController? controller;
  final Widget child;
  final EdgeInsetsGeometry scrollableAreaPadding;
  final Widget bottomWidget;
  final ScrollPhysics? physics;

  BottomWidgetLayout({
    super.key,
    this.controller,
    required this.child,
    required this.bottomWidget,
    this.scrollableAreaPadding = const EdgeInsets.all(0),
    this.physics = const BouncingScrollPhysics(),
  }) {
    assert(
      child is! ListView,
      "BottomWidgetLayout only supports child of type Column. "
      "Ensure that the child is not a ListView and consider using Column instead.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              controller: controller,
              padding: scrollableAreaPadding,
              physics: physics,
              child: child,
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: constraints.maxWidth,
                child: bottomWidget,
              ),
            ),
          ],
        );
      },
    );
  }
}
