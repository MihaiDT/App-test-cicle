import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

import 'package:lines/modules/welcome_quiz/widgets/quiz_button_check.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_highlighted_box.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_select_title.dart';

class QuizSelectButton extends StatelessWidget {
  final bool selected;
  final String title;
  final VoidCallback onPressed;

  const QuizSelectButton({
    required this.title,
    required this.selected,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: QuizHighlightedBox(
        selected: selected,
        child: Padding(
          padding: ThemeEdgeInsets.allSmall,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuizSelectTitle(
                selected: selected,
                title: title,
              ),
              QuizButtonCheck(
                selected: selected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
