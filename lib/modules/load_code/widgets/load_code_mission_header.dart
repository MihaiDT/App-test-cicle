import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class LoadCodeMissionHeader extends StatelessWidget {
  final String title;
  final String description;

  const LoadCodeMissionHeader({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeadlineLarge(
          title,
          textAlign: TextAlign.center,
        ).applyShaders(context),
        ThemeSizedBox.height8,
        BodyMedium(
          description,
          textAlign: TextAlign.center,
          color: ThemeColor.darkBlue,
        ),
      ],
    );
  }
}
