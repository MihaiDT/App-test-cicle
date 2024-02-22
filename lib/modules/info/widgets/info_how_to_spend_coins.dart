import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoHowToSpendCoins extends StatelessWidget {
  const InfoHowToSpendCoins({
    super.key,
  });

  static const Color _containerColor = Color(
    0xfff3eef4,
  );

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
            "Come posso\nspendere i Coins?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height24,
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: _containerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                const Flexible(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadlineMedium(
                        "Lucky Lines",
                        color: ThemeColor.darkBlue,
                      ),
                      BodySmall(
                        "Puoi usare i tuoi Coins per tentare la fortuna e provare a vincere i tuoi premi preferiti.",
                        color: ThemeColor.darkBlue,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    ThemeImage.luckyLines,
                  ),
                )
              ],
            ),
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
