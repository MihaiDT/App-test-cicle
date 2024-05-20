import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/confirm_tutor_email/confirm_tutor_email_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

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
            child: SecondaryButton(
              onPressed: () {
                Get.offNamedUntil(
                  Routes.login,
                  (route) => false,
                );
              },
              child: const TitleLarge("PROCEDI").applyShaders(context),
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
                  'Ci siamo quasi, manca solo la conferma del genitore o tutore.',
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "È necessario che il tuo genitore o tutore visioni ed accetti le condizioni di utilizzo perchè tu possa accedere all'app",
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
                  onTap: () {
                    controller.sendEmail();
                  },
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
