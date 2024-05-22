import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/name_surname/controller/name_surname_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class NameSurnamePage extends GetView<NameSurnameController> {
  const NameSurnamePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "CONOSCIAMOCI",
        ),
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
                          /// Assign TextEditingController values to User saved in the state
                          appController.registerParameter.firstName =
                              controller.nameController.text;
                          appController.registerParameter.lastName =
                              controller.surnameController.text;
                          appController.registerParameter.nickname =
                              controller.nicknameController.text;
                          AdjustManager.trackEvent(EventType.nameSurname);
                          Get.toNamed(Routes.birthDate);
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
            children: [
              ThemeSizedBox.height16,
              const DisplayMedium(
                "Come ti chiami?",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height32,
              InputTextField(
                label: "Nome*",
                placeholder: "Inserisci il tuo nome",
                textEditingController: controller.nameController,
                onChanged: (txt) {
                  controller.nameValue.value = txt;
                },
                focusNode: controller.nameFocusNode,
                onSubmitted: (_) {
                  FocusScope.of(context)
                      .requestFocus(controller.surnameFocusNode);
                },
              ),
              ThemeSizedBox.height24,
              InputTextField(
                label: "Cognome*",
                placeholder: "Inserisci il tuo cognome",
                textEditingController: controller.surnameController,
                onChanged: (txt) {
                  controller.surnameValue.value = txt;
                },
                focusNode: controller.surnameFocusNode,
                onSubmitted: (_) {
                  FocusScope.of(context)
                      .requestFocus(controller.nicknameFocusNode);
                },
              ),
              ThemeSizedBox.height32,
              const Divider(
                thickness: 2,
              ),
              ThemeSizedBox.height32,
              InputTextField(
                label: "Nickname (facoltativo)",
                placeholder: "Scegli un nickname",
                textEditingController: controller.nicknameController,
                focusNode: controller.nicknameFocusNode,
                onSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
