import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/last_menses/controller/last_menses_controller.dart';
import 'package:lines/modules/last_menses/widget/horizontal_range_calendar.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class LastMensesPage extends GetView<LastMensesController> {
  const LastMensesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(
        title: HeadlineMedium(
          "PARLACI DEL TUO CICLO",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ValueListenableBuilder(
                  valueListenable: controller.datetimeRange,
                  builder: (_, DateTimeRange? value, __) {
                    return SecondaryButton(
                      onPressed: () {
                        PiwikManager.trackEvent(
                          PiwikEventType.registration,
                          action: 'step 7 optional - period calendar',
                        );

                        if (value != null) {
                          appController.updateUserParameters
                              .lastMenstruationDateStart = value.start;

                          appController.updateUserParameters
                              .lastMenstruationDateEnd = value.end;

                          AdjustManager.trackEvent(
                            AjustEventType.lastMensesConfirmed,
                          );

                          Get.toNamed(Routes.howLongMensesPage);
                        }
                      },
                      child: const TitleLarge(
                        "AVANTI",
                        letterSpacing: 2,
                      ).applyShaders(context),
                    );
                  },
                ),
                ThemeSizedBox.height8,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () {
                      AdjustManager.trackEvent(
                        AjustEventType.lastMensesDenied,
                      );
                      PiwikManager.trackEvent(
                        PiwikEventType.registration,
                        action: 'step 7 optional - period calendar',
                      );
                      Get.toNamed(Routes.howLongMensesPage);
                    },
                    child: const TitleMedium(
                      "NON ME LO RICORDO",
                      underline: true,
                      letterSpacing: 1.5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          child: Column(
            children: [
              ThemeSizedBox.height16,
              const DisplayMedium(
                "Quando hai avuto\n le ultime mestruazioni?",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Indica la data di inizio e fine\n delle tue mestruazioni",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height32,
              HorizontalRangeCalendar(
                onRangeSelected: (selectedRange) {
                  controller.datetimeRange.value = selectedRange;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
