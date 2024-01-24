import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_color.dart';

import 'quiz_select_multiple_title.dart';

class QuizSelectMultipleButton extends StatelessWidget {
  final String title;
  final bool selected;

  final VoidCallback onPressed;

  const QuizSelectMultipleButton({
    required this.title,
    required this.selected,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? ThemeColor.brightPink : Colors.white,
          border: Border.all(
            color: ThemeColor.brightPink,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(90),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          child: QuizSelectedMultipleTitle(
            selected: selected,
            title: title,
          ),
        ),
      ),
    );
  }
}
