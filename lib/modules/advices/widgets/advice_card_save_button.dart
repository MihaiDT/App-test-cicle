import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/theme_icon.dart';

class AdviceCardSaveButton extends StatelessWidget {
  final bool isSaved;
  final Function(bool)? onTap;

  const AdviceCardSaveButton({
    required this.isSaved,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null ? () => onTap!(!isSaved) : null,
      child: isSaved
          ? SvgPicture.asset(ThemeIcon.savedFilled)
          : SvgPicture.asset(ThemeIcon.savedEmpty),
    );
  }
}
