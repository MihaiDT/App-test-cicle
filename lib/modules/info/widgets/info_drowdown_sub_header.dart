import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoDropDownSubHeader extends StatelessWidget {
  final String title;

  const InfoDropDownSubHeader({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HeadlineSmall(
      title,
      color: ThemeColor.darkBlue,
    );
  }
}
