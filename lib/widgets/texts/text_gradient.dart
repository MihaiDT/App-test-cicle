import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class TextGradient extends StatelessWidget {
  const TextGradient({
    super.key,
    required this.text,
  });

  final Text text;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => ThemeGradient.primary.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: text,
    );
  }
}
