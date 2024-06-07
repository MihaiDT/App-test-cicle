import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';

class ConsentBottomSheet extends StatelessWidget {
  const ConsentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  " Per utilizzare il servizio Calendario Mestruale acconsenti al trattamento dei dati relativi al ciclo, come da informativa ",
              children: const [
                TextSpan(
                  text: "informativa privacy",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text:
                      ". Il consenso è necessario per utilizzare il servizio Calendario Mestruale.",
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
            ).applyShaders(context),
          ),
          ThemeSizedBox.height16,
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.acceptConsent);
            },
            child: const TitleMedium(
              "NON ACCONSENTO",
              underline: true,
              textAlign: TextAlign.center,
            ),
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
