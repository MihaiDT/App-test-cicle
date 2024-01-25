import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class WalkthroughStep1 extends StatelessWidget {
  const WalkthroughStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ThemeSize.paddingLarge,
        right: ThemeSize.paddingLarge,
        top: ThemeSize.heightAppBarDefault,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 240,
            width: 240,
            child: Placeholder(
              color: Colors.grey[400]!,
            ),
          ),
          ThemeSizedBox.height24,
          const DisplayMedium(
            "Personalizza il tuo\navatar e gioca",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height16,
          const BodyLarge(
            "Crea il tuo avatar e personalizzalo come più ti piace per rendere l'app ancora più tua!\nE quando ha i le mestruazioni non dimenticare di giocare e prenderti cura di lui.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
