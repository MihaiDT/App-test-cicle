import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/modules/birth_date/birth_date_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class BirthDatePage extends GetView<BirthDateController> {
  const BirthDatePage({super.key});

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
                  text: "AVANTI",
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
                );
              },
            ),
          ),
          child: Column(
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
              Row(
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
                      errorMessage: controller.dayError.value,
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
                      hasError: controller.hasErrors.value,
                      textAlign: TextAlign.center,
                      textEditingController: controller.monthController.value,
                      keyboardType: TextInputType.number,
                      errorMessage: controller.monthError.value,
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
            ],
          ),
        ),
      ),
    );
  }
}
