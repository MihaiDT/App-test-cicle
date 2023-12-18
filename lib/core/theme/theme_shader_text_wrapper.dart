import 'package:flutter/cupertino.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/widgets/texts/text_gradient.dart';

mixin ThemeShaderTextWrapper on TextWrapper {
  /// This method should be used to apply shaders to a TextWrapper widget
  Widget applyShaders(BuildContext context) {
    return TextGradient(
      text: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: getBaseTextStyle(context),
      ),
    );
  }
}
