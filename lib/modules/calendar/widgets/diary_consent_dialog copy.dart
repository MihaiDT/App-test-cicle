import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/routes/routes.dart';

class DiaryConsentDialog extends StatelessWidget {
  const DiaryConsentDialog({
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
              "Inizia a utilizzare il tuo diario.",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Per utilizzare il servizio Diario acconsenti al trattamento dei ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ThemeColor.darkBlue,
                        ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed(Routes.diaryDataDetails),
                    text: 'dati sulla tua salute e sulla tua sessualità',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ThemeColor.brightPink,
                          height: 1.2,
                          decoration: TextDecoration.underline,
                          decorationColor: ThemeColor.brightPink,
                        ),
                  ),
                  TextSpan(
                    text: ' da te inseriti, come da ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ThemeColor.darkBlue),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {
                            // TODO: privacy
                          },
                    text: 'informativa privacy',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ThemeColor.brightPink,
                          height: 1.2,
                          decoration: TextDecoration.underline,
                          decorationColor: ThemeColor.brightPink,
                        ),
                  ),
                  TextSpan(
                    text:
                        '. Il consenso è necessario per utilizzare il servizio Diario dell’app e per salvare i dati inseriti.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ThemeColor.darkBlue,
                        ),
                  ),
                ],
              ),
            ),
            ThemeSizedBox.height8,
            Image.asset(
              ThemeImage.speechBubble,
            ),
            Image.asset(
              height: 100,
              ThemeImage.happyDroppy,
            ),
            ThemeSizedBox.height32,
            GestureDetector(
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
                  child: TitleLarge(
                    "ACCONSENTO",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ThemeSizedBox.height16,
            GestureDetector(
              onTap: () {
                Navigator.pop(context, false);
              },
              child: const TitleLarge(
                "NON ACCONSENTO",
                textAlign: TextAlign.center,
              ).applyShaders(context),
            ),
            ThemeSizedBox.height32,
          ],
        ),
      ),
    );
  }
}
