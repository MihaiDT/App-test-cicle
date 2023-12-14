import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../../../widgets/texts/text_gradient.dart';

class WalkthroughStep2 extends StatelessWidget {
  const WalkthroughStep2({super.key});

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
              ThemeImage.walkthrough1,
              fit: BoxFit.contain,
            ),
          ),
          ThemeSizedBox.height24,
          TextGradient(
            text: Text(
              "Monitora il ciclo\nmestruale",
              textAlign: TextAlign.center,
              style: ThemeTextStyle.largeDark,
            ),
          ),
          ThemeSizedBox.height16,
          Text(
            "Tieni sempre sotto controllo il tuo calendario mestruale, monitora i sintomi, registra l'attività sessuale e prendi nota dell'andamento del tuo benessere lungo tutto il mese.",
            textAlign: TextAlign.center,
            style: ThemeTextStyle.bodyDark,
          ),
        ],
      ),
    );
  }
}
