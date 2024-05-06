import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_header.dart';

class MissionsHowToParticipateStepThree extends StatelessWidget {
  const MissionsHowToParticipateStepThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemeSizedBox.height20,
          const MissionsHowToParticipateHeader(
            stepNumber: 3,
            description: "Ricevi subito il tuo premio",
          ),
          ThemeSizedBox.height16,
          const Center(
            child: SizedBox(
              height: 100,
              width: 160,
              child: Placeholder(),
            ),
          ),
          ThemeSizedBox.height20,
        ],
      ),
    );
  }
}
