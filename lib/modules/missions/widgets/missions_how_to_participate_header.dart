import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class MissionsHowToParticipateHeader extends StatelessWidget {
  final int stepNumber;
  final String description;

  const MissionsHowToParticipateHeader({
    required this.stepNumber,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DisplayLarge(
          "$stepNumber",
        ).applyShaders(context),
        ThemeSizedBox.height8,
        HeadlineSmall(
          description,
          color: ThemeColor.darkBlue,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
