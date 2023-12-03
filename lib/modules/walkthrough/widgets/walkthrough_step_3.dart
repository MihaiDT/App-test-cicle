import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme.dart';
import '../../../widgets/texts/text_gradient.dart';

class WalkthroughStep3 extends StatelessWidget {
  const WalkthroughStep3({super.key});

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
            height: 240.sp,
            width: 240.sp,
            child: Image.asset(
              ThemeImage.walkthrough3,
              fit: BoxFit.contain,
            ),
          ),
          ThemeSizedBox.height16,
          TextGradient(
            text: Text(
              "Consigli e contenuti\ndi esperti solo per te",
              textAlign: TextAlign.center,
              style: ThemeTextStyle.largeDark,
            ),
          ),
          ThemeSizedBox.height16,
          Text(
            "Accedi a tanti contenuti creati per te dai nostri esperti e professionisti e approfondisci i topic più rilevanti per la fase del ciclo in cui ti trovi.",
            textAlign: TextAlign.center,
            style: ThemeTextStyle.bodyDark,
          ),
        ],
      ),
    );
  }
}
