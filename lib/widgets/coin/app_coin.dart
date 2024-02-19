import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_gradient.dart';
import 'package:lines/core/theme/theme_icon.dart';

class AppCoin extends StatelessWidget {
  final int coinAmount;
  final bool _isSmall;

  const AppCoin({
    required this.coinAmount,
    super.key,
  }) : _isSmall = false;

  const AppCoin.small({
    required this.coinAmount,
    super.key,
  }) : _isSmall = true;

  double get _imageRadius => _isSmall ? 12.0 : 16.0;

  double get _padding => _isSmall ? 8.0 : 11.0;

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
      height: _imageRadius * 2,
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
          left: _padding,
          right: _padding + _imageRadius * 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _isSmall
                ? TitleMedium(
                    '+ $coinAmount',
                    fontWeight: FontWeight.w600,
                  ).applyShaders(context)
                : HeadlineMedium(
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
          radius: _imageRadius,
          child: SvgPicture.asset(
            ThemeIcon.coin,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
