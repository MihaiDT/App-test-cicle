import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/modules/how_long_menses/controller/how_long_menses_controller.dart';
import 'package:lines/modules/how_long_menses/widget/how_often_menses_widget.dart';
import 'package:lines/modules/how_long_menses/widget/menses_duration_counter_widget.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class HowLongMensesPage extends GetView<HowLongMensesController> {
  const HowLongMensesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(
        title: TitleSmall(
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
                SecondaryButton(
                  onPressed: () => controller.onButtonPressed(),
                  child: const TitleLarge(
                    "AVANTI",
                    letterSpacing: 2,
                  ).applyShaders(context),
                ),
                ThemeSizedBox.height16,
                InkWell(
                  onTap: () {
                    AdjustManager.trackEvent(
                      AjustEventType.mensesDurationConfirmed,
                    );

                    PiwikManager.trackEvent(
                      PiwikEventType.registration,
                      action: 'step 7 optional - period duration',
                    );

                    Get.toNamed(Routes.referral);
                  },
                  child: const TitleMedium(
                    "NON LO SO",
                    underline: true,
                    letterSpacing: 1.5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          child: Column(
            children: [
              ThemeSizedBox.height16,
              const DisplayMedium(
                "Quanto durano in media le tue mestruazioni?",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height32,
              MensesDurationCounterWidget(
                onTap: (value) {
                  controller.mensesDuration = value;
                },
              ),
              ThemeSizedBox.height32,
              const Divider(),
              ThemeSizedBox.height32,
              const DisplayMedium(
                "Di solito, ogni quanti giorni ti arrivano le mestruazioni?",
              ),
              ThemeSizedBox.height32,
              HowOftenMensesWidget(
                onTap: (value) {
                  controller.howOftenMensesValue = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
