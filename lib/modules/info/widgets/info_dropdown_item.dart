import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/coin/app_coin.dart';

class InfoDropDownItem extends StatelessWidget {
  final String text;
  final int coinAmount;

  const InfoDropDownItem({
    required this.text,
    required this.coinAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BodyMedium(
          text,
          color: ThemeColor.darkBlue,
        ),
        AppCoin.small(
          coinAmount: coinAmount,
        )
      ],
    );
  }
}
