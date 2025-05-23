import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_header.dart';

class MissionsHowToParticipateStepTwo extends StatelessWidget {
  final int totalCounter;

  const MissionsHowToParticipateStepTwo({
    super.key,
    required this.totalCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingMedium,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemeSizedBox.height20,
          MissionsHowToParticipateHeader(
            stepNumber: 2,
            description: totalCounter == 1
                ? "Carica il codice prodotto che trovi stampato all'interno della confezione."
                : "Carica i codici prodotto che trovi stampati all'interno delle confezioni.",
          ),
          ThemeSizedBox.height8,
          const BodyMedium(
            "Tranquilla, puoi caricarli anche in momenti diversi.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height16,
          Image.asset(
            ThemeImage.findingCode,
            height: 100,
          ),
          ThemeSizedBox.height20,
        ],
      ),
    );
  }
}
