import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

class WalkthroughStep5 extends StatelessWidget {
  const WalkthroughStep5({super.key});

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
            height: Get.width * 0.7,
            width: Get.width * 0.7,
            child: Image.asset(
              ThemeImage.walkthrough5,
              fit: BoxFit.contain,
            ),
          ),
          ThemeSizedBox.height24,
          const DisplayMedium(
            "Attiva il tuo calendario",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height16,
          const BodyLarge(
            "Consenti a MyLines di inviarti notifiche: ti aiuterà a monitorare il tuo ciclo e il tuo benessere inviandoti periodicamente consigli e promemoria!",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
