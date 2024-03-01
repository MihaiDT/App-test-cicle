import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/routes/routes.dart';

class CoinTotal extends StatelessWidget {
  final int totalCoins;
  final bool showSuffix;
  final bool _large;

  const CoinTotal({
    required this.totalCoins,
    this.showSuffix = false,
    super.key,
  }) : _large = false;

  const CoinTotal.large({
    required this.totalCoins,
    this.showSuffix = false,
    super.key,
  }) : _large = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.yourCoinsPage,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: ThemeGradient.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(
              _large ? 60 : 16,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            _large ? 8 : 2,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                ThemeIcon.coin,
              ),
              ThemeSizedBox.width6,
              showSuffix
                  ? _large
                      ? DisplaySmall(
                          '$totalCoins Coins',
                        )
                      : TitleMedium(
                          '$totalCoins Coins',
                        )
                  : _large
                      ? DisplaySmall(
                          '$totalCoins',
                        )
                      : TitleMedium(
                          '$totalCoins',
                        ),
              ThemeSizedBox.width8,
            ],
          ),
        ),
      ),
    );
  }
}
