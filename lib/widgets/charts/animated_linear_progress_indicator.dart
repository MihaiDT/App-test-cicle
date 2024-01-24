import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_color.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  final double value;

  const AnimatedLinearProgressIndicator({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      tween: Tween<double>(
        begin: 0,
        end: value,
      ),
      builder: (context, value, _) => LinearProgressIndicator(
        value: value,
        color: ThemeColor.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }
}
