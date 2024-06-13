import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoWhatAreCoinsBottomSheet extends StatelessWidget {
  final Color? color;

  const InfoWhatAreCoinsBottomSheet({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: Column(
          children: [
            ThemeSizedBox.height8,
            const DisplayMedium(
              "Cosa sono i Coins?",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const BodyLarge(
              "I Coins sono la moneta virtuale dell'app My Lines. Puoi accumularli caricando i codici che trovi all'interno dei prodotti Lines, rispondendo ai sondaggi o invitando altre amiche a scaricare l'app. Puoi utilizzare i Coins per partecipare ai concorsi Lucky Lines",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              ThemeImage.bigCoin,
              width: 230,
            ),
            ThemeSizedBox.height48,
          ],
        ),
      ),
    );
  }
}
