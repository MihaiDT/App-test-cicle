import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class WalkthroughDot extends StatelessWidget {
  final int currentStepIndex;
  final int dotIndex;

  const WalkthroughDot({
    required this.currentStepIndex,
    required this.dotIndex,
    super.key,
  });

  final Duration animationDuration = const Duration(
    milliseconds: 300,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          currentStepIndex == dotIndex ? 12 : 6,
        ),
        color: ThemeColor.primary,
        gradient: ThemeGradient.primary,
      ),
      duration: animationDuration,
      curve: Curves.easeOut,
      height: currentStepIndex == dotIndex ? 12 : 6,
      width: currentStepIndex == dotIndex ? 12 : 6,
    );
  }
}
