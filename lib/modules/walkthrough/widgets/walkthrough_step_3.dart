import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../../../core/theme/text_wrapper.dart';
import '../../../widgets/texts/text_gradient.dart';

class WalkthroughStep3 extends StatelessWidget {
  const WalkthroughStep3({super.key});

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
            child: Image.asset(
              ThemeImage.walkthrough3,
              fit: BoxFit.contain,
            ),
          ),
          ThemeSizedBox.height16,
          const DisplayMedium(
            "Consigli e contenuti\ndi esperti solo per te",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height16,
          const BodyLarge(
            "Accedi a tanti contenuti creati per te dai nostri esperti e professionisti e approfondisci i topic più rilevanti per la fase del ciclo in cui ti trovi.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
