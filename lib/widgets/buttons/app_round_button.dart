import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppRoundButton extends StatelessWidget {
  final Color? backGroundColor;
  final Color? iconColor;
  final String iconPath;
  final GestureTapCallback onTap;
  final Gradient? gradient;
  final double? radius;

  const AppRoundButton({
    this.backGroundColor,
    this.iconColor,
    required this.iconPath,
    this.gradient,
    required this.onTap,
    required this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backGroundColor,
          shape: BoxShape.circle,
          gradient: gradient,
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
