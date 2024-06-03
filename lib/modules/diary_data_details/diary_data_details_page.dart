import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/cookies_fingerprinting/cookies_fingerprinting_controller.dart';
import 'package:lines/modules/diary_data_details/diary_data_details_controller.dart';

import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class DiaryDataDetailsPage extends GetView<DiaryDataDetailsController> {
  const DiaryDataDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "CONSENSO SERVIZIO DIARIO",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadlineLarge(
                  "Elenco dati",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height16,
                BodySmall(
                  "Ecco le informazioni che potrai inserire nel tuo diario giornaliero per prenderti cura di te e seguire il tuo ciclo mestruale.",
                  color: ThemeColor.darkBlue.withOpacity(0.5),
                ),
                ThemeSizedBox.height16,
                const Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: BodySmall(
                    "• Flusso mestruale\n"
                    "• Perdite\n"
                    "• Sintomi\n"
                    "• Attività sessuale\n"
                    "• Desiderio sessuale\n"
                    "• Contraccettivi\n"
                    "• Mood\n"
                    "• Livello di stress\n"
                    "• Livello di energia\n"
                    "• Attività fisica\n"
                    "• Pelle\n"
                    "• Capelli\n"
                    "• Sonno\n"
                    "• Peso\n"
                    "• Acqua",
                    color: ThemeColor.darkBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
