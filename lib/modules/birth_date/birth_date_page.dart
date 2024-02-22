import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/birth_date/birth_date_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class BirthDatePage extends GetView<BirthDateController> {
  const BirthDatePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        title: const TitleSmall(
          "CONOSCIAMOCI",
        ),
        onBackPressed: () {
          controller.clearAll();
        },
      ),
      body: SafeArea(
        child: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingLarge,
          ),
          bottomWidget: Padding(
            padding: const EdgeInsets.only(
              left: ThemeSize.paddingLarge,
              right: ThemeSize.paddingLarge,
            ),
            child: Obx(
              () {
                return SecondaryButton(
                  onPressed: controller.canProceed
                      ? () {
                          controller.checkBirthDate(
                            controller.dayController.value.text,
                            controller.monthController.value.text,
                            controller.yearController.value.text,
                            context,
                          );
                        }
                      : null,
                  child: const TitleLarge(
                    "AVANTI",
                  ).applyShaders(context),
                );
              },
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ThemeSizedBox.height60,
              const DisplayMedium(
                "Qual è la tua data di nascita?",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Inserisci la tua data di nascita corretta, così puoi avere un calendario mestruale disegnato per te.",
                textAlign: TextAlign.center,
              ),
              Obx(
                () => Row(
                  children: [
                    Flexible(
                      flex: 120,
                      child: InputTextField(
                        focusNode: controller.dayFocus,
                        contentPaddingLeft: 0,
                        label: "",
                        placeholder: "GG",
                        textAlign: TextAlign.center,
                        textEditingController: controller.dayController.value,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                        ],
                        onChanged: (txt) {
                          controller.dayValue.value = txt;
                        },
                      ),
                    ),
                    ThemeSizedBox.width16,
                    Flexible(
                      flex: 120,
                      child: InputTextField(
                        focusNode: controller.monthFocus,
                        contentPaddingLeft: 0,
                        label: "",
                        placeholder: "MM",
                        textAlign: TextAlign.center,
                        textEditingController: controller.monthController.value,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                        ],
                        onChanged: (txt) {
                          controller.monthValue.value = txt;
                        },
                      ),
                    ),
                    ThemeSizedBox.width16,
                    Flexible(
                      flex: 160,
                      child: InputTextField(
                        focusNode: controller.yearFocus,
                        contentPaddingLeft: 0,
                        label: "",
                        placeholder: "AAAA",
                        textAlign: TextAlign.center,
                        textEditingController: controller.yearController.value,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4),
                        ],
                        onChanged: (txt) {
                          controller.yearValue.value = txt;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ThemeSizedBox.height12,
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Obx(() {
                  return Column(
                    children: List<Widget>.generate(
                      controller.errorList.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: BodyMedium(
                            controller.errorList.elementAt(index).value,
                            color: ThemeColor.menstruationColor,
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
