import 'package:flutter/material.dart';

class DisplayLarge extends TextWrapper {
  const DisplayLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }
}

class DisplayMedium extends TextWrapper {
  const DisplayMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }
}

class DisplaySmall extends TextWrapper {
  const DisplaySmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }
}

class HeadlineLarge extends TextWrapper {
  const HeadlineLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge;
  }
}

class HeadlineMedium extends TextWrapper {
  const HeadlineMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium;
  }
}

class HeadlineSmall extends TextWrapper {
  const HeadlineSmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall;
  }
}

class BodyLarge extends TextWrapper {
  const BodyLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }
}

class BodyMedium extends TextWrapper {
  const BodyMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }
}

class BodySmall extends TextWrapper {
  const BodySmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }
}

class LabelSmall extends TextWrapper {
  const LabelSmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall;
  }
}

class TitleLarge extends TextWrapper {
  const TitleLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }
}

class TitleMedium extends TextWrapper {
  const TitleMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }
}

class TitleSmall extends TextWrapper {
  const TitleSmall(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }
}

class LabelLarge extends TextWrapper {
  const LabelLarge(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge;
  }
}

class LabelMedium extends TextWrapper {
  const LabelMedium(
    super.text, {
    super.key,
    super.color,
    super.fontWeight,
    super.height,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.underline,
  });

  @override
  TextStyle? getBaseTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium;
  }
}

abstract class TextWrapper extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool underline;

  TextStyle? getBaseTextStyle(BuildContext context);

  const TextWrapper(
    this.text, {
    super.key,
    required this.color,
    required this.fontWeight,
    required this.height,
    required this.maxLines,
    required this.overflow,
    required this.textAlign,
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getBaseTextStyle(context)?.copyWith(
        color: color,
        height: height,
        fontWeight: fontWeight,
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
