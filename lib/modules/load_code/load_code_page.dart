import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/load_code/load_code_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/coin/coin_total.dart';
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
          )
        ],
      ),
      body: BottomWidgetLayout(
        scrollableAreaPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        bottomWidget: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Obx(() {
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
          }),
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
            Obx(() {
              return GestureDetector(
                onTap: controller.openKeyboard,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      10,
                      (index) {
                        String writtenText = "";
                        ("controller.writtenCode[index]");
                        if (controller.writtenCode[index].isNotEmpty) {
                          writtenText = controller.writtenCode[index];
                        }
                        return _buildSingleCell(writtenText);
                      },
                    ),
                  ),
                ),
              );
            }),
            ThemeSizedBox.height8,
            const TitleMedium(
              "HAI BISOGNO DI AIUTO?",
              underline: true,
            ).applyShaders(context),
            Visibility.maintain(
              visible: false,
              child: IgnorePointer(
                child: TextField(
                  autofocus: true,
                  maxLength: 10,
                  controller: controller.codeController,
                  focusNode: controller.codeFocusNode,
                  keyboardType: TextInputType.number,
                  onChanged: controller.updateWrittenCode,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleCell(String text) {
    return Container(
      width: 30,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(
            0xFFE4D8E7,
          ),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ), /*TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
        ),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        maxLength: 1,
        buildCounter: (BuildContext context,
                {int? currentLength, int? maxLength, bool? isFocused}) =>
            null,
      ),*/
    );
  }
}
