import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/widgets/cards/elevated_card.dart';
import 'package:url_launcher/url_launcher.dart';

class AdvicesGynecologistBox extends StatelessWidget {
  const AdvicesGynecologistBox({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        PiwikManager.trackEvent(
          PiwikEventType.gynecologist,
        );

        await launchUrl(
          Uri.parse("https://lines.it/ginecologia/domande-risposte-ginecologa"),
          mode: LaunchMode.externalApplication,
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ElevatedCard.withBorder(
            borderColor: Colors.white.withOpacity(0.6),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DisplayMedium(
                        'Chiedi alla ginecologa',
                      ).applyShaders(context),
                      const BodySmall(
                        'La nostra Ginecologa online\nrisponderà alle tue domande',
                        color: ThemeColor.darkBlue,
                      ),
                      ThemeSizedBox.height12,
                      const TitleMedium(
                        'CHIEDI ORA',
                        underline: true,
                      ).applyShaders(context),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Image.asset(
                ThemeImage.ginecologa,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
