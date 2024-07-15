import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/confirm_conditions/confirm_condition_controller.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmConditionPage extends GetView<ConfirmConditionController> {
  const ConfirmConditionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
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
                  onPressed: () {},
                  child: const TitleLarge(
                    "PROCEDI",
                    letterSpacing: 2,
                  ).applyShaders(context),
                ),
                ThemeSizedBox.height16,
                InkWell(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse(
                        appController.settings.value?.helpdeskUrl ??
                            'https://linesit.digimetrica.com/contatti-servizio-consumatori?from=app',
                      ),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: const TitleMedium(
                    "HAI BISOGNO DI AIUTO?",
                    underline: true,
                    textAlign: TextAlign.center,
                  ),
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
                ThemeSizedBox.height48,
                Image.asset(
                  ThemeImage.welcomeEmail,
                ),
                ThemeSizedBox.height36,
                const DisplayMedium(
                  'Ci siamo quasi, accetta  le condizioni  di utilizzo  per accedere',
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "Abbiamo inviato un'e-mail all'indirizzo",
                  textAlign: TextAlign.center,
                ),
                TitleLarge(
                  controller.email,
                ),
                const BodyMedium(
                  "Visiona e accetta le condizioni di utilizzo per poter accedere all’app",
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
                InkWell(
                  onTap: () {
                    controller.sendNewEmail();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TitleMedium(
                      "INVIA DI NUOVO",
                      underline: true,
                      textAlign: TextAlign.center,
                    ),
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
