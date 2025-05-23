import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/confirm_tutor_email/confirm_tutor_email_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmTutorEmailPage extends GetView<ConfirmTutorEmailController> {
  const ConfirmTutorEmailPage({
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
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SecondaryButton(
                  onPressed: () {
                    AdjustManager.trackEvent(AjustEventType.tutorConfirmEmail);

                    Get.offAndToNamed(
                      Routes.login,
                    );
                  },
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
                Image.asset(
                  ThemeImage.welcomeEmail,
                ),
                ThemeSizedBox.height36,
                const DisplayMedium(
                  'Ci siamo quasi, manca solo la conferma del tuo genitore o tutore.',
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "È necessario che il tuo genitore o tutore visioni ed accetti le condizioni di utilizzo e confermi "
                  "la tua registrazione all'app My Lines cliccando sul link apposito.",
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height24,
                const HeadlineLarge(
                  "L’email non è stata ricevuta?",
                  fontWeight: FontWeight.w500,
                ),
                ThemeSizedBox.height8,
                const BodyMedium(
                  "Consiglia al tuo genitore/tutore di controllare la posta indesiderata.\nSe non la trova clicca su",
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height8,
                InkWell(
                  onTap: () => controller.sendEmail(),
                  child: const TitleMedium(
                    "INVIA DI NUOVO",
                    underline: true,
                    textAlign: TextAlign.center,
                    letterSpacing: 2,
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
