import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_gradient.dart';
import 'package:lines/core/theme/theme_icon.dart';

class AppCoin extends StatelessWidget {
  final int coinAmount;

  const AppCoin({
    super.key,
    required this.coinAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _coinText(context),
        _coinRoundImage,
      ],
    );
  }

  Widget _coinText(BuildContext context) {
    return Container(
      height: imageRadius * 2,
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          gradient: ThemeGradient.primary,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 14,
          right: 11 + imageRadius * 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeadlineMedium(
              '+ $coinAmount',
            ).applyShaders(context),
          ],
        ),
      ),
    );
  }

  Widget get _coinRoundImage {
    return Positioned(
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: ThemeGradient.primary,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 16.0,
          child: SvgPicture.asset(
            ThemeIcon.coin,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }

  double get imageRadius => 16.0;
}
