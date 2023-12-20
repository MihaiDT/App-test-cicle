import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';

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
        ? TitleMedium(title).applyShaders(context)
        : TitleMedium(
            title,
            color: ThemeColor.darkBlue,
          );
  }
}
