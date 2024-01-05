import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class NameSurnamePage extends StatelessWidget {
  const NameSurnamePage({super.key});

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
      body: BottomWidgetLayout(
        scrollableAreaPadding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingLarge,
        ),
        bottomWidget: Padding(
          padding: const EdgeInsets.only(
            left: ThemeSize.paddingLarge,
            right: ThemeSize.paddingLarge,
          ),
          child: SecondaryButton(
            text: "AVANTI",
            onPressed: () {
              Get.toNamed(Routes.birthDate);
            },
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.statusBarHeight,
            ),
            const DisplayMedium(
              "Come ti chiami?",
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height32,
            InputTextField(
              label: "Nome*",
              placeholder: "Inserisci il tuo nome",
              textEditingController: TextEditingController(),
            ),
            ThemeSizedBox.height24,
            InputTextField(
              label: "Cognome*",
              placeholder: "Inserisci il tuo cognome",
              textEditingController: TextEditingController(),
            ),
            ThemeSizedBox.height32,
            const Divider(
              thickness: 2,
            ),
            ThemeSizedBox.height32,
            InputTextField(
              label: "Nickname (facoltativo)",
              placeholder: "Scegli un nickname",
              textEditingController: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
