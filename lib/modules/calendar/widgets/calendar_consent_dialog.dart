import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarConsentDialog extends StatelessWidget {
  const CalendarConsentDialog({
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
              "Inizia a monitorare le mestruazioni.",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const BodyMedium(
              "Per utilizzare il servizio Calendario Mestruale acconsenti al trattamento dei dati relativi al ciclo, come da",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height8,
            InkWell(
              onTap: () async {
                await launchUrl(
                  Uri.parse(
                    "https://lines.it/termini-e-condizioni/app-my-lines",
                  ),
                  mode: LaunchMode.externalApplication,
                );
              },
              child: const BodyMedium(
                "informativa privacy.",
                color: ThemeColor.brightPink,
                height: 1.2,
                decorationColor: ThemeColor.brightPink,
                underline: true,
                textAlign: TextAlign.center,
              ),
            ),
            ThemeSizedBox.height8,
            const BodyMedium(
              "Il consenso è necessario per utilizzare il servizio Calendario Mestruale.",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
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
                  child: TitleLarge(
                    "ACCONSENTO",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ThemeSizedBox.height16,
            InkWell(
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
