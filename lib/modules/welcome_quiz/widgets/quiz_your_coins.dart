import 'package:flutter/material.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/widgets/coin/coin_total.dart';

class QuizYourCoins extends StatelessWidget {
  final int totalCoins;

  const QuizYourCoins({
    required this.totalCoins,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.whiteDarkOpaque,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ThemeSizedBox.width12,
            const TitleMedium(
              'I tuoi coins:',
              color: ThemeColor.darkBlue,
              fontWeight: FontWeight.w500,
            ),
            ThemeSizedBox.width8,
            CoinTotal(
              totalCoins: totalCoins,
            ),
            ThemeSizedBox.width4,
          ],
        ),
      ),
    );
  }
}
