import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/cards/elevated_card.dart';
import 'package:lines/widgets/charts/glowing_linear_progress_indicator.dart';

class ProfileCompletionPercentageSection extends StatelessWidget {
  const ProfileCompletionPercentageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard.withBorder(
      color: Colors.white,
      borderColor: Colors.white.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15,
        ),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Row(
              children: [
                ThemeSizedBox.height24,
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constrains.maxWidth * 0.4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const DisplayMedium(
                        "Profilo al 30%",
                      ).applyShaders(context),
                      ThemeSizedBox.height4,
                      const TitleMedium(
                        "Completalo per ottenere il badge: Completa profilo",
                        color: ThemeColor.darkBlue,
                      ),
                      ThemeSizedBox.height4,
                      const TitleMedium(
                        "COMPLETA",
                        underline: true,
                      ).applyShaders(context),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        ThemeImage.badge,
                      ),
                      ThemeSizedBox.height8,
                      const GlowingLinearProgressIndicator(
                        value: 0.3,
                      ),
                    ],
                  ),
                ),
                ThemeSizedBox.height24,
              ],
            );
          },
        ),
      ),
    );
  }
}
