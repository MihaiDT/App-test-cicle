import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/walkthrough/walkthrough_dot.dart';

class WalkthroughDotsRow extends StatelessWidget {
  final int currentStepIndex;
  final int numberOfDots;

  const WalkthroughDotsRow({
    required this.currentStepIndex,
    required this.numberOfDots,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        numberOfDots,
        (index) {
          if (index < numberOfDots - 1) {
            return Row(
              children: [
                WalkthroughDot(
                  currentStepIndex: currentStepIndex,
                  dotIndex: index,
                ),
                ThemeSizedBox.width8,
              ],
            );
          } else {
            return WalkthroughDot(
              currentStepIndex: currentStepIndex,
              dotIndex: index,
            );
          }
        },
      ),
    );
  }
}
