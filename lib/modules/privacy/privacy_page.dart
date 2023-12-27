import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/modules/privacy/widgets/privacy_detail_widget.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AppScaffoldPage(
        backgroundImage: ThemeDecoration.images.bgDark,
        extendBodyBehindAppBar: true,
        body: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingLarge,
          ),
          bottomWidget: Padding(
            padding: const EdgeInsets.only(
              left: ThemeSize.paddingLarge,
              right: ThemeSize.paddingLarge,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const TitleMedium(
                    "ACCETTA TUTTO",
                    underline: true,
                  ),
                ),
                ThemeSizedBox.height16,
                SecondaryButton(
                  text: "REGISTRATI",
                  onPressed: () {},
                ),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.statusBarHeight,
              ),
              const DisplayMedium(
                "La privacy prima di tutto",
              ),
              ThemeSizedBox.height32,
              const PrivacyDetailWidget(
                title: "Resta aggiornato sul mondo Lines",
                description:
                    "Ricevi comunicazioni su Lines e permettici di svolgere ricerche di mercato, come da [informativa privacy]. In qualsiasi momento potrai modificare la tua preferenza.",
              ),
              ThemeSizedBox.height24,
              const PrivacyDetailWidget(
                title: "Ricevi contenuti e missioni personalizzate per te!",
                description:
                    "Per noi è importante conoscere i tuoi interessi! Permettici di darti un'esperienza personalizzata inviandoti comunicazioni e promozioni non generiche su Lines e, se lo vorrai, anche sugli altri marchi della famiglia Fater e nostri partner terzi, come da informativa privacy. In qualsiasi momento potrai modificare le tue preferenze.",
              ),
              ThemeSizedBox.height24,
              const PrivacyDetailWidget(
                title: "Ricevi comunicazioni e offerte su altri prodotti",
                description:
                    "Ricevi comunicazioni sugli altri brand della famiglia Fater e nostri partner terzi, e permettici di svolgere ricerche di mercato, come da informativa privacy. In qualsiasi momento potrai modificare la tua preferenza.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
