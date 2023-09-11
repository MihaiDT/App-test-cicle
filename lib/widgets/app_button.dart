import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../core/app_theme.dart';

class AppButton extends StatelessWidget {
  final bool gradient;
  final bool filled;
  final bool fullWidth;
  final String text;
  final GestureTapCallback? onTap;

  const AppButton({
    super.key,
    required this.gradient,
    required this.filled,
    required this.fullWidth,
    required this.text,
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
                      gradient: AppTheme.gradients.primary,
                      width: 2,
                    )
                  : Border.all(
                      color: AppTheme.colors.buttonBgColor,
                      width: 2,
                    ),
          borderRadius: BorderRadius.circular(60),
          boxShadow: filled ? [AppTheme.shadows.button] : null,
          color: filled
              ? gradient
                  ? null
                  : AppTheme.colors.buttonBgColor
              : Colors.transparent,
          gradient: gradient ? AppTheme.gradients.primary : null,
        ),
        padding: const EdgeInsets.only(
          bottom: 16,
          top: 13,
          left: 20,
          right: 20,
        ),
        width: fullWidth ? double.maxFinite : null,
        child: filled
            ? gradient
                ? _text()
                : _gradientText()
            : gradient
                ? _gradientText()
                : _text(),
      ),
    );
  }

  Widget _gradientText() {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => AppTheme.gradients.primary.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: _text(),
    );
  }

  Widget _text() {
    return Text(
      text.toUpperCase(),
      style: AppTheme.fonts.button,
      textAlign: TextAlign.center,
    );
  }
}
