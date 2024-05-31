import 'package:flutter/cupertino.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/texts/text_gradient.dart';

mixin ThemeShaderTextWrapper on TextWrapper {
  /// This method should be used to apply shaders to a TextWrapper widget
  Widget applyShaders(BuildContext context) {
    return TextGradient(
      text: Text(
        text,
        key: key,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: getBaseTextStyle(context)!.copyWith(
          color: color,
          decoration: underline ? TextDecoration.underline : null,
          decorationColor: decorationColor,
          fontWeight: fontWeight,
          height: height,
          letterSpacing: letterSpacing,
          leadingDistribution:
              height != null ? null : TextLeadingDistribution.even,
        ),
      ),
    );
  }
}
