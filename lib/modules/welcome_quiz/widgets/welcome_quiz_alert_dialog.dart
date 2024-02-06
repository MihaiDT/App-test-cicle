import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/welcome_quiz/controllers/welcome_quiz_alert_dialog_controller.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class WelcomeQuizAlertDialog extends StatelessWidget {
  WelcomeQuizAlertDialog({
    super.key,
  });

  final controller = Get.put(WelcomeQuizAlertDialogController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingLarge,
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          image: ThemeDecoration.images.bgQuestionMark,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 38,
            right: 38,
            top: 40,
            bottom: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DisplayMedium(
                "WELCOME QUIZ",
              ).applyShaders(context),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Raccontaci qualcosa in più su di te:\n riceverai subito 150 Coins!",
                color: ThemeColor.darkBlue,
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height16,
              AppCoin(
                coinAmount: controller.coinAmount,
              ),
              ThemeSizedBox.height60,
              Image(
                image: AssetImage(
                  ThemeImage.quizIntroImage,
                ),
              ),
              ThemeSizedBox.height60,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const TitleLarge(
                        "CHIUDI",
                        textAlign: TextAlign.center,
                      ).applyShaders(context),
                    ),
                  ),
                  ThemeSizedBox.width16,
                  Expanded(
                    child: PrimaryButton(
                      child: const TitleLarge(
                        "VAI AL QUIZ",
                      ),
                      onPressed: () {
                        controller.onContinueButtonPressed();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
