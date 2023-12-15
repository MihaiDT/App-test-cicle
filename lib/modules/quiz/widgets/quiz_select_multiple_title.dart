import 'package:flutter/material.dart';

import '../../../core/theme/theme_text_style.dart';

class QuizSelecteMultipleTitle extends StatelessWidget {
  final String title;
  final bool selected;

  const QuizSelecteMultipleTitle({
    required this.selected,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: selected
          ? ThemeTextStyle.welcomeQuizMultipleSelectionLight
          : ThemeTextStyle.welcomeQuizMultipleSelectionDarkPink,
    );
  }
}
