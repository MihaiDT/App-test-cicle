import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredFilter extends StatelessWidget {
  final Widget child;
  final double borderRadiusDegrees;

  const BlurredFilter({
    super.key,
    required this.child,
    this.borderRadiusDegrees = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            borderRadiusDegrees,
          ),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 12,
          sigmaY: 12,
        ),
        child: child,
      ),
    );
  }
}
