import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/widgets/info_card.dart';

class InfoHowToGetCoinsBottomSheet extends StatelessWidget {
  const InfoHowToGetCoinsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeSize.paddingSmall),
      child: Column(
        children: [
          ThemeSizedBox.height32,
          const DisplayMedium(
            "Come si ottengono i\nCoins?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height24,
          InfoCard(
            title: "Carica codici",
            description:
                "Acquista i tuoi prodotti Lines e carica, nell'apposita area,  i codici che trovi nelle confezioni.",
            imagePath: ThemeImage.loadProduct,
          ),
          ThemeSizedBox.height16,
          InfoCard(
            title: "Questionari",
            description:
                "Raccontaci di più su di te e rispondi alle domande dei questionari.",
            imagePath: ThemeImage.quizIntroImage,
          ),
          ThemeSizedBox.height16,
          InfoCard(
            title: "Invita un amico",
            description:
                "Invita un'amica a iscriversi a My Lines e sarai ricompensata!",
            imagePath: ThemeImage.inviteAFriend,
          ),
        ],
      ),
    );
  }
}
