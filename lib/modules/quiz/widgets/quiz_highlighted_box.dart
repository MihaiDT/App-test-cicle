import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_gradient.dart';

class QuizHighlightedBox extends StatelessWidget {
  final Widget? child;
  final bool selected;

  const QuizHighlightedBox({
    this.child,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: selected
            ? GradientBoxBorder(
                gradient: ThemeGradient.primary,
                width: 2,
              )
            : Border.all(
                color: ThemeColor.whiteDark,
                width: 1,
              ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
