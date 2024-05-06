import 'package:flutter/material.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_gradient.dart';
import 'package:lines/core/theme/theme_image.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';

class TooYoungErrorDialog extends StatelessWidget {
  const TooYoungErrorDialog({super.key});

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
              "Ops... Devi avere almeno 14 anni per accedere!",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const BodyLarge(
              "Ci dispiace: sei minore di 14 anni non puoi accedere all'app My Lines per questioni di sicurezza e privacy.",
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
            Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
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
                    child: TitleMedium(
                      "CHIUDI",
                    ),
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
