import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/controller/welcome_quiz_card_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/elevated_card.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class WelcomeQuizCard extends GetView<WelcomeQuizCardController> {
  const WelcomeQuizCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard.withBorder(
      onPressed: () {
        Get.toNamed(Routes.welcomeQuizIntroPage);
      },
      backgroundImage: ThemeDecoration.images.bgQuestionMark,
      borderColor: Colors.white,
      color: ThemeColor.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingMedium,
          vertical: ThemeSize.paddingSmall,
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DisplayMedium(
                    "Welcome Quiz",
                  ).applyShaders(context),
                  ThemeSizedBox.height4,
                  BodySmall(
                    "Raccontaci qualcosa su di te e ricevi subito ${controller.coinAmount} Coins",
                    color: ThemeColor.darkBlue,
                  ),
                  ThemeSizedBox.height4,
                  AppCoin(
                    coinAmount: controller.coinAmount,
                  ),
                ],
              ),
            ),
            Image.asset(
              ThemeImage.quizIntroImage,
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
