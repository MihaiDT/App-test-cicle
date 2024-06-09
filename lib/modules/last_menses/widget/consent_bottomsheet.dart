import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsentBottomSheet extends StatelessWidget {
  const ConsentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingLarge,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ThemeSizedBox.height32,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      decorationColor: Colors.white,
                    ),
                text:
                    "Per utilizzare il servizio Calendario Mestruale acconsenti al trattamento dei dati relativi al ciclo, come da informativa ",
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await launchUrl(
                          Uri.parse(
                              appController.settings.value?.privacyUrl ?? ''),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    text: "informativa privacy",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                  ),
                  TextSpan(
                    text:
                        ". Il consenso è necessario per utilizzare il servizio Calendario Mestruale.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
            ThemeSizedBox.height40,
            SecondaryButton(
              onPressed: () {
                Get.back(result: true);
              },
              child: const TitleLarge(
                "ACCONSENTO",
                letterSpacing: 2,
              ).applyShaders(context),
            ),
            ThemeSizedBox.height24,
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.acceptConsent);
              },
              child: const TitleMedium(
                "NON ACCONSENTO",
                letterSpacing: 2,
                textAlign: TextAlign.center,
                underline: true,
              ),
            ),
            ThemeSizedBox.height16,
          ],
        ),
      ),
    );
  }
}
