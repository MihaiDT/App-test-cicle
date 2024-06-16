import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/last_menses/controller/accept_consent_controller.dart';
import 'package:lines/widgets/buttons/secondary_loading_button.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class AcceptConsentPage extends GetView<AcceptConsentController> {
  const AcceptConsentPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ThemeImage.bgGradientGray),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: BottomWidgetLayout(
            scrollableAreaPadding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            bottomWidget: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Obx(
                    () {
                      return SecondaryLoadingButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        isLoading: controller.pageIsPending.value,
                        child: const TitleLarge(
                          "TORNA INDIETRO",
                        ).applyShaders(context),
                      );
                    },
                  ),
                  ThemeSizedBox.height8,
                  InkWell(
                    onTap: controller.onContinue,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: TitleMedium(
                        "NON ACCONSENTO",
                        underline: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ThemeSizedBox.height60,
                Image.asset(
                  ThemeImage.areYouSure,
                ),
                ThemeSizedBox.height24,
                const DisplayMedium(
                  "Sei sicuro?",
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height16,
                const BodyLarge(
                  "Attenzione, se non acconsenti non potrai utilizzare il calendario e monitorare il tuo ciclo.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
