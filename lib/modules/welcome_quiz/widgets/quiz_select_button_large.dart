import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_highlighted_box.dart';
import 'package:lines/modules/welcome_quiz/widgets/quiz_select_title.dart';

class QuizSelectButtonLarge extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final String title;
  final VoidCallback onPressed;

  const QuizSelectButtonLarge({
    required this.imagePath,
    required this.selected,
    required this.title,
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
          child: Column(
            children: [
              Image.network(
                imagePath,
                height: 100,
              ),
              ThemeSizedBox.height12,
              QuizSelectTitle(
                title: title,
                selected: selected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
