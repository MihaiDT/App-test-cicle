import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/widgets/info_where_to_find_the_code_bottomsheet..dart';
import 'package:lines/modules/load_code/controllers/load_code_controller.dart';
import 'package:lines/modules/missions/widgets/missions_loaded_products.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
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
        title: TitleMedium(
          _title,
          color: ThemeColor.darkBlue,
        ),
        actions: [
          Obx(
            () {
              return CoinTotal(
                totalCoins: controller.totalCoins.value,
              );
            },
          ),
        ],
      ),
      body: Obx(
        () {
          return SafeArea(
            child: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: BottomWidgetLayout(
                scrollableAreaPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                bottomWidget: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeSize.paddingLarge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Obx(
                        () => PrimaryLoadingButton(
                          isLoading: controller.isPending.value,
                          onPressed: controller.onConfirm,
                          child: const TitleLarge(
                            "CONFERMA",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    if (controller.selectedMission != null) ...[
                      ThemeSizedBox.height24,
                      TitleMedium(
                        "FINO AL ${controller.selectedMission!.endAt}",
                        color: ThemeColor.brightPink,
                        textAlign: TextAlign.center,
                      ),
                      ThemeSizedBox.height8,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: HeadlineLarge(
                          controller.selectedMission!.description,
                          color: ThemeColor.darkBlue,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ThemeSizedBox.height16,
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                        ),
                        child: MissionsLoadedProducts(
                          text: _missionLoadedProductsText,
                          products: controller.selectedMission!.loadedProducts,
                          totalCodes: controller.selectedMission!.totalCounter,
                          showBottomLink: true,
                        ),
                      ),
                    ],
                    if (controller.selectedMission == null) ...[
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
                      InkWell(
                        onTap: () => controller.showBottomSheet(
                          context,
                          const InfoWhereToFindTheCodeBottomSheet(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: const TitleMedium(
                            "DOVE TROVO IL CODICE?",
                            underline: true,
                          ).applyShaders(context),
                        ),
                      ),
                    ],
                    ThemeSizedBox.height48,
                    const TitleMedium(
                      "CARICA CODICE",
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
        },
      ),
    );
  }

  String get _title =>
      controller.selectedMission != null ? "MISSIONI" : "CARICA CODICE";

  String get _missionLoadedProductsText {
    if (controller.selectedMission != null &&
        controller.selectedMission!.totalCounter > 1) {
      return "Inserisci i ${controller.selectedMission!.totalCounter} codici per completare la missione";
    }

    return "Inserisci 1 codice per completare la missione";
  }
}
