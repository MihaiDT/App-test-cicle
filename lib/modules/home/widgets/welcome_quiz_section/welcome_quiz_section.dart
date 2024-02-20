import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/cards/coin_card.dart';

class WelcomeQuizSection extends StatelessWidget {
  const WelcomeQuizSection({
    super.key,
  });

  static const _coins = 25;
  static const _bgColor = Color(0xffedecf6);

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
          CoinCard(
            iconPath: ThemeImage.quizIntroImage,
            coinAmount: _coins,
            description:
                "Raccontaci qualcosa su di te e ricevi subito $_coins Coins",
            title: "Welcome Quiz",
            backgroundImage: DecorationImage(
              image: AssetImage(
                ThemeImage.questionMarksGroup,
              ),
              fit: BoxFit.cover,
            ),
            backgroundColor: _bgColor,
          ),
        ],
      ),
    );
  }
}
