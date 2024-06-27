import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/privacy/controller/privacy_controller.dart';
import 'package:lines/modules/privacy/widgets/privacy_detail_widget.dart';
import 'package:lines/widgets/buttons/secondary_loading_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPage extends GetView<PrivacyController> {
  const PrivacyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AppScaffoldPage(
        backgroundImage: ThemeDecoration.images.bgDark,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Obx(
            () {
              return BottomWidgetLayout(
                scrollableAreaPadding: const EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingLarge,
                ),
                bottomWidget: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeSize.paddingLarge,
                  ),
                  child: SecondaryLoadingButton(
                    onPressed: () {
                      controller.registerUser();
                    },
                    isLoading: controller.buttonIsPending.value,
                    child: const TitleLarge(
                      "PROCEDI CON LA REGISTRAZIONE",
                      letterSpacing: 2,
                    ).applyShaders(context),
                  ),
                ),
                child: Column(
                  children: [
                    ThemeSizedBox.height36,
                    const DisplayMedium(
                      "La privacy prima di tutto",
                    ),
                    ThemeSizedBox.height32,
                    PrivacyDetailWidget(
                      title: "Resta aggiornato sul mondo Lines",
                      description:
                          "Vuoi conoscere tutte le novità che Lines sta pensando per te? Ricevi comunicazioni su Lines e permettici di svolgere ricerche di mercato, come da [informativa privacy]().",
                      onChanged: (value) {
                        controller.firstAccepted.value = value;
                      },
                      value: controller.firstAccepted.value,
                    ),
                    if (controller.arguments?.userIsAdult == true ||
                        (appController.user.value?.age ?? 0) > 17) ...[
                      ThemeSizedBox.height24,
                      PrivacyDetailWidget(
                        title: "Contenuti e missioni personalizzate per te!",
                        description:
                            "Per noi è importante conoscere i tuoi interessi! Permettici di offrirti un'esperienza personalizzata inviandoti contenuti, comunicazioni e promozioni non generiche su Lines, e se lo vorrai, sugli altri marchi della famiglia Fater e sui nostri partner terzi, e di individuare nuovi contatti simili al tuo profilo, come da [informativa privacy]().",
                        onChanged: (value) {
                          controller.secondAccepted.value = value;
                        },
                        value: controller.secondAccepted.value,
                      ),
                    ],
                    ThemeSizedBox.height24,
                    PrivacyDetailWidget(
                      title: "Non perdere le novità su altri prodotti",
                      description:
                          "Ricevi comunicazioni sugli altri brand della famiglia Fater e sui nostri partner terzi e permettici di svolgere ricerche di mercato, come da [informativa privacy]().",
                      onChanged: (value) {
                        controller.thirdAccepted.value = value;
                      },
                      value: controller.thirdAccepted.value,
                    ),
                    ThemeSizedBox.height24,
                    MarkdownBody(
                      data:
                          "In qualsiasi momento potrai modificare le tue preferenze.\n"
                          "Procedendo con la registration dichiari di aver letto l'[informativa]() sul trattamento dei dati personali.",
                      styleSheet: MarkdownStyleSheet(
                        a: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                        p: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      onTapLink: (text, href, title) {
                        launchUrl(
                          Uri.parse(
                            "https://lines.it/informativa-privacy/app-my-lines",
                          ),
                        );
                      },
                    ),
                    ThemeSizedBox.height32,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
