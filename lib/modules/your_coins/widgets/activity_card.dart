import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class ActivityCard extends StatelessWidget {
  final String formattedDate;
  final String title;
  final int coinAmount;
  final String? imagePath;

  const ActivityCard({
    required this.formattedDate,
    required this.title,
    required this.coinAmount,
    this.imagePath,
    super.key,
  });

  static const Color _bgColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingMedium,
        vertical: ThemeSize.paddingSmall,
      ),
      decoration: const BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelLarge(
                  formattedDate,
                  color: ThemeColor.brightPink,
                ),
                ThemeSizedBox.height4,
                HeadlineMedium(
                  title,
                  color: ThemeColor.darkBlue,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                ThemeSizedBox.height16,
                AppCoin.small(
                  coinAmount: coinAmount,
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox.square(
            dimension: 100,
            child: imagePath != null
                ? Image.asset(imagePath!)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
