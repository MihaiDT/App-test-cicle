import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_color.dart';

import 'package:lines/core/theme/theme_text_style.dart';

class QuizSelectedMultipleTitle extends StatelessWidget {
  final String title;
  final bool selected;

  const QuizSelectedMultipleTitle({
    required this.selected,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        height: 1.4,
        fontSize: 14,
        color: selected ? Colors.white : ThemeColor.brightPink,
        fontWeight: NewThemeTextStyle.weightMedium,
      ),
    );
  }
}
