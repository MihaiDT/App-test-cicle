import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../core/app_theme.dart';
import '../texts/text_gradient.dart';

class AppButton extends StatelessWidget {
  final bool gradient;
  final bool filled;
  final String text;
  final GestureTapCallback? onTap;
  final bool small;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.gradient,
    required this.filled,
    this.fullWidth = true,
    required this.text,
    this.small = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => {},
      child: Container(
        decoration: BoxDecoration(
          border: filled
              ? null
              : gradient
                  ? GradientBoxBorder(
                      gradient: ThemeGradient.primary,
                      width: 2,
                    )
                  : Border.all(
                      color: ThemeColor.buttonBackground,
                      width: 2,
                    ),
          borderRadius: BorderRadius.circular(small ? 20 : 60),
          boxShadow: filled ? [ThemeShadow.buttonShadow] : null,
          color: filled
              ? gradient
                  ? null
                  : ThemeColor.buttonBackground
              : Colors.transparent,
          gradient: gradient ? ThemeGradient.primary : null,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: small ? 10.sp : 20.sp,
          vertical: small ? 4.sp : 16.sp,
        ),
        width: fullWidth ? double.maxFinite : null,
        child: filled
            ? gradient
                ? _text
                : TextGradient(text: _text)
            : gradient
                ? TextGradient(text: _text)
                : _text,
      ),
    );
  }

  Text get _text {
    return Text(
      text.toUpperCase(),
      style: small ? ThemeTextStyle.buttonSmall : ThemeTextStyle.button,
      textAlign: TextAlign.center,
    );
  }
}
