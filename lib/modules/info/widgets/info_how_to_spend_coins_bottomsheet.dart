import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/widgets/info_card.dart';

class InfoHowToSpendCoinsBottomSheet extends StatelessWidget {
  const InfoHowToSpendCoinsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Column(
        children: [
          ThemeSizedBox.height8,
          const DisplayMedium(
            "Come posso\nspendere i Coins?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height24,
          const InfoCard(
            title: "Lucky Lines",
            description:
                "Puoi usare i tuoi Coins per tentare la fortuna e provare a vincere i tuoi premi preferiti.",
            imagePath: ThemeImage.luckyLines,
          ),
          ThemeSizedBox.height48,
        ],
      ),
    );
  }
}
