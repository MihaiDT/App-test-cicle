import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/referral/referral_controller.dart';
import 'package:lines/modules/referral/widget/referral_coin_card.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_loading_button.dart';
import 'package:lines/widgets/forms/input_text_field.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class ReferralPage extends GetView<ReferralController> {
  const ReferralPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(),
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
                  () => SecondaryLoadingButton(
                    isLoading: controller.isLoading.value,
                    onPressed: controller.canProceed.value
                        ? () {
                            if (!controller.isLoading.value) {
                              controller.onUseCodePressed(context);
                            }
                          }
                        : null,
                    child: const TitleLarge(
                      "USA IL CODICE",
                    ).applyShaders(context),
                  ),
                ),
                ThemeSizedBox.height8,
                GestureDetector(
                  onTap: () {
                    if (!controller.isLoading.value) {
                      controller.onSkipPressed(context);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: TitleMedium(
                      "CONTINUA SENZA",
                      underline: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Image.asset(
                  ThemeImage.friendship,
                ),
              ),
              ThemeSizedBox.height32,
              const DisplayMedium(
                "Hai un codice amico?",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height24,
              InputTextField(
                label: "Inserisci il codice",
                textEditingController: controller.referralCodeController,
              ),
              ThemeSizedBox.height32,
              ReferralCoinCard(
                coinValue: controller.coinValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
