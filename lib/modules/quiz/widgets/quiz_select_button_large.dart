import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_edge_insets.dart';

import '../../../core/theme/theme_sized_box.dart';
import '../../quiz/widgets/quiz_highlighted_box.dart';
import 'quiz_select_title.dart';

class QuizSelectButtonLarge extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final String title;

  const QuizSelectButtonLarge({
    required this.imagePath,
    required this.selected,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QuizHighlightedBox(
      selected: selected,
      child: Padding(
        padding: ThemeEdgeInsets.allSmall,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
            ThemeSizedBox.height12,
            QuizSelectTitle(
              title: title,
              selected: selected,
            ),
          ],
        ),
      ),
    );
  }
}
