import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/load_code/widgets/load_code_earned_coins.dart';
import 'package:lines/routes/routes.dart';

class CompletedMissionCard extends StatelessWidget {
  final Product product;

  const CompletedMissionCard({
    required this.product,
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
          title: product.category,
          earnedCoinsAmount: product.points,
          imageUrl: product.imageUrl,
        ),
        ThemeSizedBox.height16,
        InkWell(
          onTap: () {
            Get.toNamed(
              Routes.infoDropdownResultsPage,
            );
          },
          child: const TitleMedium(
            "QUANTI COINS VALGONO I PRODOTTI?",
            underline: true,
          ).applyShaders(context),
        ),
      ],
    );
  }
}
