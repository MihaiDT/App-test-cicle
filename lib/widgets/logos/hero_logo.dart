import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/app_theme.dart';

class HeroLogo extends StatelessWidget {
  static const heroTag = 'hero_logo';

  final double size;

  const HeroLogo({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset(
          ThemeIcon.logo,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
