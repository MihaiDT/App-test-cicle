import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_theme.dart';
import '../../../widgets/texts/text_gradient.dart';

class WalkthroughStep5 extends StatelessWidget {
  const WalkthroughStep5({super.key});

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
            height: Get.width * 0.7,
            width: Get.width * 0.7,
            child: Image.asset(
              ThemeImage.walkthrough5,
              fit: BoxFit.contain,
            ),
          ),
          ThemeSizedBox.height24,
          TextGradient(
            text: Text(
              "Attiva il tuo calendario",
              textAlign: TextAlign.center,
              style: ThemeTextStyle.largeDark,
            ),
          ),
          ThemeSizedBox.height16,
          Text(
            "Consenti a MyLines di inviarti notifiche: ti aiuterà a monitorare il tuo ciclo e il tuo benessere inviandoti periodicamente consigli e promemoria!",
            textAlign: TextAlign.center,
            style: ThemeTextStyle.bodyDark,
          ),
        ],
      ),
    );
  }
}
