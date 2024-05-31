import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class LoadCodeEarnedCoins extends StatelessWidget {
  final String title;
  final int earnedCoinsAmount;
  final String? imageUrl;

  const LoadCodeEarnedCoins({
    required this.title,
    required this.earnedCoinsAmount,
    this.imageUrl,
    super.key,
  });

  static const Color _bgColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: _bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: ThemeSize.paddingSmall,
          horizontal: ThemeSize.paddingLarge,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SizedBox.square(
                dimension: 80,
                child: imageUrl?.isNotEmpty == true
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.scaleDown,
                      )
                    : const Placeholder(),
              ),
            ),
            ThemeSizedBox.width12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleMedium(
                  title,
                  color: ThemeColor.darkBlue,
                ),
                const BodySmall(
                  "Hai guadagnato:",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height8,
                AppCoin(
                  coinAmount: earnedCoinsAmount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
