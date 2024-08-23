import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/confirm_conditions/confirm_condition_controller.dart';
import 'package:lines/repository/parameters_class/registration_provider.dart';
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
                (appController.user.value?.provider ==
                        RegistrationProvider.email)
                    ? SecondaryButton(
                        onPressed: controller.logIn,
                        child: const TitleLarge(
                          "PROCEDI",
                          letterSpacing: 2,
                        ).applyShaders(context),
                      )
                    : SecondaryButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse(
                              appController.user.value?.landingLink ??
                                  'https://lines.it',
                            ),
                            mode: LaunchMode.externalApplication,
                          );

                          controller.logIn();
                        },
                        child: const TitleLarge(
                          "CONTINUA",
                          letterSpacing: 2,
                        ).applyShaders(context),
                      ),
                ThemeSizedBox.height16,
                InkWell(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse(
                        appController.settings.value?.helpdeskUrl ??
                            'https://lines.it/contatti-servizio-consumatori?from=app',
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
                if (appController.user.value?.provider !=
                    RegistrationProvider.email) ...[
                  Image.asset(
                    ThemeImage.inviteAFriend,
                    fit: BoxFit.contain,
                    width: Get.width * 0.6,
                  ),
                  ThemeSizedBox.height36,
                  const DisplayMedium(
                    'Ci siamo quasi, accetta  le condizioni  di utilizzo  per accedere',
                    textAlign: TextAlign.center,
                  ),
                  ThemeSizedBox.height16,
                  const BodyMedium(
                    "Visiona e accetta le condizioni di utilizzo per poter accedere all’app.",
                    textAlign: TextAlign.center,
                  ),
                ],
                if (appController.user.value?.provider ==
                    RegistrationProvider.email) ...[
                  Image.asset(
                    ThemeImage.welcomeEmail,
                  ),
                  ThemeSizedBox.height36,
                  DisplayMedium(
                    (appController.user.value?.hasMoreThan18Years == false)
                        ? 'Ci siamo quasi, manca solo la conferma del tuo genitore o tutore.'
                        : 'Ci siamo quasi, accetta  le condizioni  di utilizzo  per accedere',
                    textAlign: TextAlign.center,
                  ),
                  ThemeSizedBox.height16,
                  const BodyMedium(
                    "Abbiamo inviato un'email all'indirizzo",
                    textAlign: TextAlign.center,
                  ),
                  TitleLarge(
                    controller.email,
                  ),
                  BodyMedium(
                    (appController.user.value?.hasMoreThan18Years == false)
                        ? "È necessario che il tuo genitore o tutore visioni ed accetti le condizioni di utilizzo perché tu possa accedere all'app My Lines"
                        : "Visiona e accetta le condizioni di utilizzo per poter accedere all’app.",
                    textAlign: TextAlign.center,
                  ),
                  ThemeSizedBox.height32,
                  HeadlineLarge(
                    (appController.user.value?.hasMoreThan18Years == false)
                        ? "L'email non è stata ricevuta?"
                        : "Non hai ricevuto l'email?",
                    fontWeight: FontWeight.w500,
                  ),
                  ThemeSizedBox.height8,
                  BodyMedium(
                    (appController.user.value?.hasMoreThan18Years == false)
                        ? "Consiglia al tuo genitore/tutore\n di controllare la Posta indesiderata.\nSe non la trova clicca su"
                        : "Controlla nella Posta indesiderata.\nSe non la trovi clicca su",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
