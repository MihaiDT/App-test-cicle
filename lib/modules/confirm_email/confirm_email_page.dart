import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/confirm_email/confirm_email_controller.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

import '../../widgets/appbar/transparent_app_bar.dart';
import '../../widgets/buttons/secondary_button.dart';

class ConfirmEmailPage extends GetView<ConfirmEmailController> {
  const ConfirmEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      appBar: TransparentAppBar(
        leading: const SizedBox(),
        actions: [
          SecondaryButton(
            text: 'ASSISTENZA',
            onPressed: () {},
            buttonSize: ButtonSize.h31,
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: BottomWidgetLayout(
          bottomWidget: Padding(
            padding: const EdgeInsets.only(
              left: ThemeSize.paddingLarge,
              right: ThemeSize.paddingLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SecondaryButton(
                  text: "ACCEDI",
                  onPressed: controller.logIn,
                ),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              children: [
                ThemeSizedBox.height90,
                Image.asset(
                  ThemeImage.welcomeEmail,
                ),
                ThemeSizedBox.height36,
                const DisplayMedium(
                  'Ci siamo quasi,conferma il tuo indirizzo email!',
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "Abbiamo mandato una mail all'indirizzo:",
                  textAlign: TextAlign.center,
                ),
                TitleLarge(controller.appController.registerParameter.email),
                const BodyMedium(
                  "Aprila per confermare la tua registrazione a\n My Lines",
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height32,
                const HeadlineLarge(
                  "Non hai ricevuto la mail?",
                  fontWeight: FontWeight.w500,
                ),
                ThemeSizedBox.height8,
                const BodyMedium(
                  "Controlla nella Posta indesiderata.\nSe non la trovi prova con",
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height8,
                GestureDetector(
                  onTap: () {},
                  child: const TitleMedium(
                    "INVIA DI NUOVO",
                    underline: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
