import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/blurred_filter.dart';
import 'package:lines/widgets/cards/elevated_card.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class CoinCard extends StatelessWidget {
  final int coinAmount;
  final String description;
  final String title;
  final String iconPath;
  final Color? backgroundColor;
  final DecorationImage? backgroundImage;
  final VoidCallback? onTap;

  const CoinCard({
    required this.coinAmount,
    required this.description,
    required this.title,
    required this.iconPath,
    this.backgroundColor,
    this.backgroundImage,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlurredFilter(
      borderRadiusDegrees: 24,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedCard(
          onPressed: onTap,
          color: backgroundColor,
          backgroundImage: backgroundImage,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 26,
              top: 14,
              bottom: 14,
              right: 26,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DisplayMedium(
                        title,
                        color: ThemeColor.brightPink,
                      ).applyShaders(context),
                      ThemeSizedBox.height4,
                      BodySmall(
                        description,
                        color: ThemeColor.darkBlue,
                      ),
                      ThemeSizedBox.height8,
                      AppCoin.small(
                        coinAmount: coinAmount,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 12,
                  child: Image.asset(
                    iconPath,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
