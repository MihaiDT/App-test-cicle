import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lines/core/theme/theme_icon.dart';

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
      child: SvgPicture.asset(
        isSaved ? ThemeIcon.savedFilled : ThemeIcon.savedEmpty,
        height: 24,
        width: 24,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
