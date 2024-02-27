import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/load_code/widgets/load_code_earned_coins.dart';

class CompletedMissionCard extends StatelessWidget {
  final Function()? onTap;
  final int earnedCoinsAmount;

  const CompletedMissionCard({
    this.onTap,
    required this.earnedCoinsAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DisplayMedium(
          "Hai caricato un codice!",
        ).applyShaders(context),
        ThemeSizedBox.height32,
        LoadCodeEarnedCoins(
          title: "LINES E",
          earnedCoinsAmount: earnedCoinsAmount,
        ),
        ThemeSizedBox.height16,
        InkWell(
          onTap: onTap,
          child: const TitleMedium(
            "QUANTI COINS VALGONO I PRODOTTI?",
            underline: true,
          ).applyShaders(context),
        ),
      ],
    );
  }
}
