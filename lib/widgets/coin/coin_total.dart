import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class CoinTotal extends StatelessWidget {
  final int totalCoins;
  final bool showSuffix;

  const CoinTotal({
    required this.totalCoins,
    this.showSuffix = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ThemeGradient.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              ThemeIcon.coin,
            ),
            ThemeSizedBox.width6,
            showSuffix
                ? TitleMedium(
                    '$totalCoins Coins',
                  )
                : TitleMedium(
                    '$totalCoins',
                  ),
            ThemeSizedBox.width8,
          ],
        ),
      ),
    );
  }
}
