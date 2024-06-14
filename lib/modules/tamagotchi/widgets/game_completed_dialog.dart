import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/main/main_controller.dart';

class GameCompletedDialog extends StatelessWidget {
  const GameCompletedDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingLarge,
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 38,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ThemeSizedBox.height40,
            const DisplayMedium(
              "Grazie! Ora si che\nsono felice!",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const BodyLarge(
              "È tempo di rilassarti e di scoprire i tanti contenuti e consigli pensati per te!",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height8,
            Image.asset(
              ThemeImage.speechBubble,
            ),
            Image.asset(
              height: 100,
              ThemeImage.talkingDroppy,
            ),
            ThemeSizedBox.height32,
            InkWell(
              onTap: () {
                // Close the dialog
                Get.back();
                // Close the game
                Get.back();
                // Go to advices
                final mainController = Get.find<MainController>();
                mainController.onTapBottomNavigationBarMenu(selectedTab: 1);
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: ThemeGradient.primary,
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 22,
                  ),
                  child: TitleLarge(
                    "SCOPRI LA LIBRERIA",
                    letterSpacing: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ThemeSizedBox.height20,
          ],
        ),
      ),
    );
  }
}
