import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoBottomSheet extends StatelessWidget {
  final Widget? child;

  DraggableScrollableController get draggableScrollableController => DraggableScrollableController();

  const InfoBottomSheet({
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 4,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ThemeColor.primaryOpaque,
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
