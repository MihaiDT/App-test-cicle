import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
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
          const BodyMedium(
            "Per utilizzare il calendario mestruale acconsenti al trattamento dei dati relativi al ciclo, come da informativa privacy.",
            textAlign: TextAlign.center,
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
              Get.back(result: false);
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
