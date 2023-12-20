import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/theme/theme_gradient.dart';
import 'package:lines/core/theme/theme_icon.dart';

class AppRoundButton extends StatelessWidget {
  final GestureTapCallback onTap;

  const AppRoundButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: ThemeGradient.primary,
        ),
        child: CircleAvatar(
          radius: 16.0,
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            ThemeIcon.close,
          ),
        ),
      ),
    );
  }
}
