import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../walkthrough_controller.dart';

class WalkthroughDots extends StatelessWidget {
  const WalkthroughDots({
    super.key,
    required this.controller,
  });

  final Duration animationDuration = const Duration(milliseconds: 300);

  final WalkthroughController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _dot(0),
        ThemeSizedBox.width8,
        _dot(1),
        ThemeSizedBox.width8,
        _dot(2),
        ThemeSizedBox.width8,
        _dot(3),
        ThemeSizedBox.width8,
        _dot(4),
      ],
    );
  }

  Widget _dot(int index) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          controller.currentStepIndex == index ? 12 : 6,
        ),
        color: ThemeColor.primary,
        gradient: ThemeGradient.primary,
      ),
      duration: animationDuration,
      curve: Curves.easeOut,
      height: controller.currentStepIndex == index ? 12 : 6,
      width: controller.currentStepIndex == index ? 12 : 6,
    );
  }
}
