import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoWhatAreCoins extends StatelessWidget {
  const InfoWhatAreCoins({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Column(
        children: [
          ThemeSizedBox.height32,
          const DisplayMedium(
            "Cosa sono i Coins?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height16,
          const BodyLarge(
            "I Coins sono la moneta virtuale dell'app My Lines che accumuli sia utilizzando l'app che caricando i codici dei tuoi prodotti.Puoi utilizzare i Coins per partecipare alle lotterie instantanee Lucky Lines",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          Image.asset(
            ThemeImage.bigCoin,
            width: 230,
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
