import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';

class TutorialContinueButton extends StatelessWidget {
  final VoidCallback goToNextTutorial;

  const TutorialContinueButton({
    required this.goToNextTutorial,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 25,
        ),
        child: SecondaryButton(
          onPressed: goToNextTutorial,
          child: const TitleLarge(
            "AVANTI",
          ).applyShaders(context),
        ),
      ),
    );
  }
}
