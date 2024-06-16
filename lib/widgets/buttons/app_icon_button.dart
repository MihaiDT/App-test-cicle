import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lines/core/app_theme.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.icon,
    this.iconColor,
    this.iconPath,
    required this.onTap,
    this.setIconColor = true,
    this.showBg = false,
    this.backgroundColor,
  });

  static const double size = 44;

  final Widget? icon;
  final Color? iconColor;
  final String? iconPath;
  final GestureTapCallback onTap;
  final bool setIconColor;
  final bool showBg;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        color:
            showBg ? backgroundColor ?? ThemeColor.primary : Colors.transparent,
        height: size,
        width: size,
        child: iconPath != null
            ? SvgPicture.asset(
                iconPath!,
                color: setIconColor ? iconColor : ThemeColor.primary,
                fit: BoxFit.scaleDown,
              )
            : null,
      ),
      onTap: () => onTap(),
    );
  }
}
