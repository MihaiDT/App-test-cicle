import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/load_code/load_code_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/forms/code_textfield.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class LoadCodePage extends GetView<LoadCodeController> {
  const LoadCodePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleMedium(
          "CARICA CODICE",
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(
            totalCoins: controller.totalCoins,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          bottomWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Obx(
              () {
                return PrimaryButton(
                  onPressed: controller.canProceed
                      ? () {
                          Get.offAndToNamed(Routes.loadCodeResultsPage);
                        }
                      : null,
                  child: const TitleMedium(
                    "CONFERMA",
                  ),
                );
              },
            ),
          ),
          child: Column(
            children: [
              const DisplayMedium(
                "Ottieni i Coins",
              ).applyShaders(context),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Inserisci  il codice per ottenere subito dei Coins spendibili nella tua area dedicata.",
                color: ThemeColor.darkBlue,
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height16,
              const TitleMedium(
                "DOVE TROVO IL CODICE?",
              ).applyShaders(context),
              ThemeSizedBox.height48,
              const TitleMedium(
                "CODICE",
                color: ThemeColor.darkBlue,
              ),
              ThemeSizedBox.height8,
              CodeTextfield(
                onChanged: (text) {
                  controller.updateWrittenCode(text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
