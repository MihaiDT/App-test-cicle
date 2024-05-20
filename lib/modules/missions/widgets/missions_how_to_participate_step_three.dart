import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_header.dart';

class MissionsHowToParticipateStepThree extends StatelessWidget {
  final String? prizeDescription;
  final String? prizeImage;

  const MissionsHowToParticipateStepThree({
    this.prizeDescription,
    this.prizeImage,
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
          if (prizeDescription?.isNotEmpty == true)
            const MissionsHowToParticipateHeader(
              stepNumber: 3,
              description: "Ricevi subito il tuo premio",
            ),
          ThemeSizedBox.height16,
          if (prizeImage?.isNotEmpty == true)
            Center(
              child: SizedBox(
                height: 100,
                width: 160,
                child: Image.network(prizeImage ?? ''),
              ),
            ),
          ThemeSizedBox.height20,
        ],
      ),
    );
  }
}
