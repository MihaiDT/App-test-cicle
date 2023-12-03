import 'package:flutter/material.dart';

class ScrollIfNeeded extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;
  final bool disableTap;

  const ScrollIfNeeded({
    Key? key,
    required this.child,
    this.disableTap = false,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return NotificationListener<OverscrollIndicatorNotification>(
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraint.maxHeight,
              ),
              child: IntrinsicHeight(
                child: child,
              ),
            ),
          ),

          // disable the glow effect
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
        );
      },
    );
  }
}
