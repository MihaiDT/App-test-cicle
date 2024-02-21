import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class ReferralCoinCard extends StatelessWidget {
  final int coinValue;

  const ReferralCoinCard({
    required this.coinValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          bottom: 16,
          top: 16,
          right: 20,
        ),
        child: Row(
          children: [
            Image.asset(
              ThemeImage.moneyPile,
              height: 80,
            ),
            ThemeSizedBox.width12,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeadlineMedium(
                    "$coinValue Coins per te",
                    textAlign: TextAlign.left,
                  ),
                  ThemeSizedBox.height4,
                  const BodySmall(
                    "Inserisci il codice per ottenere 25 coins. Potrai utilizzare i coins per accedere a contenuti esclusivi in app.",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
