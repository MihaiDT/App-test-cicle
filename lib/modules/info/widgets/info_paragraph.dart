import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoParagraph extends StatelessWidget {
  final String title;
  final String description;

  const InfoParagraph({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineMedium(
          title,
          color: ThemeColor.darkBlue,
        ),
        ThemeSizedBox.height16,
        BodyMedium(
          description,
          color: ThemeColor.darkBlue,
        ),
      ],
    );
  }
}
