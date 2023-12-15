import 'package:flutter/material.dart';

import '../../../core/theme/theme_text_style.dart';
import '../../../widgets/texts/text_gradient.dart';

class QuizSelectTitle extends StatelessWidget {
  final String title;
  final bool selected;

  const QuizSelectTitle({
    required this.title,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return selected
        ? TextGradient(
            text: Text(
              title,
              style: ThemeTextStyle.quizSelectDark,
            ),
          )
        : Text(
            title,
            style: ThemeTextStyle.quizSelectDark,
          );
  }
}
