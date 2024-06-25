import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class ConfirmReferralDialog extends StatelessWidget {
  const ConfirmReferralDialog({
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
              "Sei sicuro?",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const BodyLarge(
              "Non potrai inserire il codice amico in un secondo momento.",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  child: const TitleLarge(
                    "INDIETRO",
                    letterSpacing: 2,
                  ).applyShaders(context),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context, true),
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
                        "AVANTI",
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ThemeSizedBox.height20,
          ],
        ),
      ),
    );
  }
}
