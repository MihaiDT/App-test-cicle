import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';

class QuizBodyText extends StatelessWidget {
  final String title;
  final String subTitle;

  const QuizBodyText({
    required this.title,
    required this.subTitle,
    super.key,
  });

  static const Color textColor = ThemeColor.darkBlue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineLarge(
          title,
          color: textColor,
        ),
        ThemeSizedBox.height8,
        BodyLarge(
          subTitle,
          color: textColor,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
