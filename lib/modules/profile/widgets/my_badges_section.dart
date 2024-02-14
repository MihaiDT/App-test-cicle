import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/profile/widgets/badge_tile.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class MyBadgesSection extends StatelessWidget {
  const MyBadgesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ThemeSizedBox.height24,
            const DisplayMedium(
              "I miei badge",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const BadgeTile(
              title: "Badge 1",
              description: "Descrizione badge 1",
              progressPercentage: 0.8,
              progressLabel: " 14/15",
            ),
            ThemeSizedBox.height32,
            const BadgeTile(
              title: "Profilo completo",
              description: "Completa il profilo al 100%",
              progressPercentage: 0.8,
              progressLabel: " 20%",
            ),
            ThemeSizedBox.height32,
            const BadgeTile(
              title: "Appassionata",
              description: "Effettua 10 accessi in app",
              progressPercentage: 0.8,
              progressLabel: "2/10",
            ),
            ThemeSizedBox.height8,
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(
                  ThemeSize.paddingSmall,
                ),
                child: Row(
                  children: [
                    const TitleLarge(
                      "TUTTI I BADGE",
                    ).applyShaders(context),
                    const Spacer(),
                    SvgPicture.asset(
                      ThemeIcon.arrowRight,
                      color: ThemeColor.darkBlue,
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            ThemeSizedBox.height20,
          ],
        ),
      ),
    );
  }
}
