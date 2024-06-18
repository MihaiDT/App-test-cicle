import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class MensesPhaseCard extends StatelessWidget {
  final VoidCallback goToNextTutorial;

  const MensesPhaseCard({
    required this.goToNextTutorial,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      color: Colors.white,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ThemeSizedBox.height24,
          const HeadlineMedium(
            "Il ciclo mestruale è composto da 4 fasi e il\n mio aspetto cambierà insieme a loro così:",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSinglePhase(
                ThemeImage.faseMestruale,
                "Fase mestruale",
              ),
              buildSinglePhase(
                ThemeImage.faseFollicolare,
                "Fase follicolare",
              ),
              buildSinglePhase(
                ThemeImage.faseOvulatoria,
                "Fase ovulatoria",
              ),
              buildSinglePhase(
                ThemeImage.faseLuteale,
                "Fase luteale",
              ),
            ],
          ),
          ThemeSizedBox.height16,
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: PrimaryButton(
              child: const TitleLarge(
                "HO CAPITO",
              ),
              onPressed: () {
                goToNextTutorial();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSinglePhase(
    String imagePath,
    String title,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 70,
          height: 70,
        ),
        ThemeSizedBox.height8,
        BodySmall(
          title,
          color: ThemeColor.darkBlue,
        ),
      ],
    );
  }
}
