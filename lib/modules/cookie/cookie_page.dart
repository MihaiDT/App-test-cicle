import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/app_button.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_padding.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(),
      backgroundImage: ThemeDecoration.images.bgDark,
      body: AppScaffoldPadding(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.04,
            ),
            Image.asset(
              ThemeImage.cookie,
              fit: BoxFit.contain,
            ),
            ThemeSizedBox.height32,
            Text(
              "Personalizza la tua esperienza",
              style: ThemeTextStyle.largeLight,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height16,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    "Quest’app utilizza cookie tecnici e cookie fingerprinting di profilazione, anche di terze parti, per offrirti contenuti, servizi e pubblicità interessanti per te sulla base delle tue attività.\n",
                style: ThemeTextStyle.bodyLight.copyWith(
                  height: 1.3,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Clicca qui per saperne di più.',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO: add function
                      },
                  ),
                ],
              ),
            ),
            const Spacer(),
            SecondaryButton(
              text: "ACCONSENTO",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
