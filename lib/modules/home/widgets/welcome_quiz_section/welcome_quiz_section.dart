import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/welcome_quiz_card.dart';

class WelcomeQuizSection extends StatelessWidget {
  const WelcomeQuizSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleMedium(
            "PREMIO DI BENVENUTO",
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.height12,
          const WelcomeQuizCard(),
        ],
      ),
    );
  }
}
