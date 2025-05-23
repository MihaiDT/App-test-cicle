import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class DisplayLarge extends TextWrapper with ThemeShaderTextWrapper {
  const DisplayLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }
}

class DisplayMedium extends TextWrapper with ThemeShaderTextWrapper {
  const DisplayMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }
}

class DisplaySmall extends TextWrapper with ThemeShaderTextWrapper {
  const DisplaySmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }
}

class HeadlineLarge extends TextWrapper with ThemeShaderTextWrapper {
  const HeadlineLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge;
  }
}

class HeadlineExtraLarge extends TextWrapper with ThemeShaderTextWrapper {
  const HeadlineExtraLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return ThemeTextStyle.headlineExtraLarge;
  }
}

class HeadlineMedium extends TextWrapper with ThemeShaderTextWrapper {
  const HeadlineMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }

  const HeadlineMedium.boldRegular(
    super.text, {
    super.key,
    super.color,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  }) : super(
          fontWeight: FontWeight.w500,
        );
}

class HeadlineSmall extends TextWrapper with ThemeShaderTextWrapper {
  const HeadlineSmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall;
  }
}

class BodyLarge extends TextWrapper with ThemeShaderTextWrapper {
  const BodyLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }
}

class BodyMedium extends TextWrapper with ThemeShaderTextWrapper {
  const BodyMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }
}

class BodySmall extends TextWrapper with ThemeShaderTextWrapper {
  const BodySmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }
}

class LabelSmall extends TextWrapper with ThemeShaderTextWrapper {
  const LabelSmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall;
  }
}

class TitleLarge extends TextWrapper with ThemeShaderTextWrapper {
  const TitleLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }
}

class TitleMedium extends TextWrapper with ThemeShaderTextWrapper {
  const TitleMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }
}

class TitleSmall extends TextWrapper with ThemeShaderTextWrapper {
  const TitleSmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }
}

class LabelLarge extends TextWrapper with ThemeShaderTextWrapper {
  const LabelLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge;
  }
}

class LabelMedium extends TextWrapper with ThemeShaderTextWrapper {
  const LabelMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.letterSpacing,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
    super.decorationColor,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium;
  }
}

abstract class TextWrapper extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? decorationColor;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool underline;

  TextStyle? getBaseTextStyle(BuildContext context);

  const TextWrapper(
    this.text, {
    this.color = Colors.white,
    this.decorationColor = Colors.white,
    required this.fontWeight,
    required this.height,
    this.letterSpacing = 0,
    required this.maxLines,
    required this.overflow,
    required this.textAlign,
    this.underline = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getBaseTextStyle(context)?.copyWith(
        color: color,
        decorationColor: decorationColor,
        height: height,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        leadingDistribution:
            height != null ? null : TextLeadingDistribution.even,
        decoration: underline ? TextDecoration.underline : null,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
