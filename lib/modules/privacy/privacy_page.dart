import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/modules/privacy/controller/privacy_controller.dart';
import 'package:lines/modules/privacy/widgets/privacy_detail_widget.dart';
import 'package:lines/widgets/buttons/secondary_loading_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

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
          child: BottomWidgetLayout(
            scrollableAreaPadding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingLarge,
            ),
            bottomWidget: Padding(
              padding: const EdgeInsets.only(
                left: ThemeSize.paddingLarge,
                right: ThemeSize.paddingLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Obx(
                        () =>
                        SecondaryLoadingButton(
                          onPressed: () {
                            controller.registerUser();
                          },
                          isLoading: controller.buttonIsPending.value,
                          child: const TitleLarge(
                            "ACCETTA TUTTO",
                          ).applyShaders(context),
                        ),
                  ),
                  ThemeSizedBox.height16,
                  GestureDetector(
                    onTap: () {},
                    child: const TitleMedium(
                      "CONTINUA CON LA MIA SELEZIONE",
                      underline: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            child: Obx(
                  () {
                return Column(
                  children: [
                    ThemeSizedBox.height36,
                    const DisplayMedium(
                      "La privacy prima di tutto",
                    ),
                    ThemeSizedBox.height32,
                    PrivacyDetailWidget(
                      title: "Resta aggiornato sul mondo Lines",
                      description:
                      "Ricevi comunicazioni su Lines e permettici di svolgere ricerche di mercato, come da [informativa privacy]. In qualsiasi momento potrai modificare la tua preferenza.",
                      onChanged: (value) {
                        controller.firstAccepted.value = value;
                      },
                      value: controller.firstAccepted.value,
                    ),
                    ThemeSizedBox.height24,
                    PrivacyDetailWidget(
                      title:
                      "Ricevi contenuti e missioni personalizzate per te!",
                      description:
                      "Per noi è importante conoscere i tuoi interessi! Permettici di darti un'esperienza personalizzata inviandoti comunicazioni e promozioni non generiche su Lines e, se lo vorrai, anche sugli altri marchi della famiglia Fater e nostri partner terzi, come da informativa privacy. In qualsiasi momento potrai modificare le tue preferenze.",
                      onChanged: (value) {
                        controller.secondAccepted.value = value;
                      },
                      value: controller.secondAccepted.value,
                    ),
                    ThemeSizedBox.height24,
                    PrivacyDetailWidget(
                      title: "Ricevi comunicazioni e offerte su altri prodotti",
                      description:
                      "Ricevi comunicazioni sugli altri brand della famiglia Fater e nostri partner terzi, e permettici di svolgere ricerche di mercato, come da informativa privacy. In qualsiasi momento potrai modificare la tua preferenza.",
                      onChanged: (value) {
                        controller.thirdAccepted.value = value;
                      },
                      value: controller.thirdAccepted.value,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
