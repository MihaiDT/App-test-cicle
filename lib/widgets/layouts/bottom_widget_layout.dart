import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class BottomWidgetLayout extends StatefulWidget {
  final ScrollController? controller;
  final Widget child;
  final EdgeInsetsGeometry scrollableAreaPadding;
  final Widget bottomWidget;
  final ScrollPhysics? physics;

  const BottomWidgetLayout({
    super.key,
    this.controller,
    required this.child,
    required this.bottomWidget,
    this.scrollableAreaPadding = const EdgeInsets.all(0),
    this.physics = const ClampingScrollPhysics(),
  }) : assert(
          child is! ListView,
          "BottomWidgetLayout only supports child of type Column. "
          "Ensure that the child is not a ListView and consider using Column instead.",
        );

  @override
  State<BottomWidgetLayout> createState() => _BottomWidgetLayoutState();
}

class _BottomWidgetLayoutState extends State<BottomWidgetLayout> {
  GlobalKey bottomWidgetKey2 = GlobalKey();
  double bottomPadding = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox box =
          bottomWidgetKey2.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        bottomPadding = box.size.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return LayoutBuilder(
          builder: (BuildContext c, BoxConstraints constraints) {
            return Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  controller: widget.controller,
                  padding: widget.scrollableAreaPadding.add(
                    EdgeInsets.only(
                      bottom: isKeyboardVisible ? 0 : bottomPadding + 30,
                    ),
                  ),
                  physics: widget.physics,
                  child: widget.child,
                ),
                Positioned(
                  key: bottomWidgetKey2,
                  bottom: 20,
                  child: Visibility(
                    visible: !isKeyboardVisible,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: widget.bottomWidget,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
