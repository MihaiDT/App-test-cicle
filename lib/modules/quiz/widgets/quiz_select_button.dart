import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_edge_insets.dart';
import 'quiz_highlighted_box.dart';
import 'quiz_button_check.dart';
import 'quiz_select_title.dart';

class QuizSelectButton extends StatelessWidget {
  final bool selected;
  final String title;

  const QuizSelectButton({
    required this.title,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuizHighlightedBox(
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
    );
  }
}
