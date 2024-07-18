import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/change_tutor_email/change_tutor_email_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class ChangeTutorEmailPage extends GetView<ChangeTutorEmailController> {
  const ChangeTutorEmailPage({
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
            child: Obx(() {
              return SecondaryButton(
                onPressed: controller.rxCanProceed.value
                    ? () {
                        controller.onContinue();
                      }
                    : null,
                child: const TitleLarge(
                  "CONFERMA",
                  letterSpacing: 2,
                ).applyShaders(context),
              );
            }),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const DisplayMedium(
                  "Inserisci la mail di un\n genitore o tutore legale",
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "Siccome sei ancora minorenne, hai bisogno che un tuo genitore o tutore visioni e accetti le condizioni "
                  "dell'app My Lines per poter accedere.\n"
                  "Invieremo una mail all’indirizzo da te indicato. "
                  "Puoi stare tranquilla: il tuo account non sarà mai accessibile ad altri.",
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height32,
                InputTextField(
                  textEditingController: controller.emailController,
                  textCapitalization: TextCapitalization.none,
                  label: "EMAIL GENITORE",
                  placeholder: "Inserisci email",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
