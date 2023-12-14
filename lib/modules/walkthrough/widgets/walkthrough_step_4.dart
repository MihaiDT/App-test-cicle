import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../../../widgets/texts/text_gradient.dart';

class WalkthroughStep4 extends StatelessWidget {
  const WalkthroughStep4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ThemeSize.widthPaddingLarge,
        right: ThemeSize.widthPaddingLarge,
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
              ThemeImage.walkthrough4,
              fit: BoxFit.contain,
            ),
          ),
          ThemeSizedBox.height16,
          TextGradient(
            text: Text(
              "Più partecipi,\npiù accumuli punti",
              textAlign: TextAlign.center,
              style: ThemeTextStyle.largeDark,
            ),
          ),
          ThemeSizedBox.height16,
          Text(
            "Partecipa alle missioni e ottieni punti per accedere a premi e contenuti esclusivi.",
            textAlign: TextAlign.center,
            style: ThemeTextStyle.bodyDark,
          ),
        ],
      ),
    );
  }
}
