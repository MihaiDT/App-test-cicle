import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';

class CoinTotal extends StatelessWidget {
  final int totalCoins;

  const CoinTotal({super.key, required this.totalCoins});

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
          children: [
            SvgPicture.asset(
              ThemeIcon.coin,
            ),
            ThemeSizedBox.width6,
            TitleMedium(
                '$totalCoins'), //FIXME: Change textStyle according to figma
            ThemeSizedBox.width8,
          ],
        ),
      ),
    );
  }
}
