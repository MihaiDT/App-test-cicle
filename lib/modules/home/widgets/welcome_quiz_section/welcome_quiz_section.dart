import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/controller/welcome_quiz_card_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/coin_card.dart';

class WelcomeQuizSection extends GetView<WelcomeQuizSectionController> {
  const WelcomeQuizSection({
    super.key,
  });

  static const _bgColor = Color(0xffedecf6);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.welcomeQuizIntroPage,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TitleMedium(
              "PREMIO DI BENVENUTO",
              color: ThemeColor.darkBlue,
              letterSpacing: 2,
            ),
            ThemeSizedBox.height12,
            CoinCard(
              iconPath: ThemeImage.quizIntroImage,
              coinAmount: controller.coinAmount,
              description:
                  "Raccontaci qualcosa su di te e ricevi subito ${controller.coinAmount} Coins",
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
      ),
    );
  }
}
