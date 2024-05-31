import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/load_code/controllers/load_code_result_controller.dart';
import 'package:lines/modules/load_code/widgets/completed_mission_card.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class LoadCodeResultsPage extends GetView<LoadCodeResultController> {
  const LoadCodeResultsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleMedium(
          "CARICA CODICE",
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(
            totalCoins: controller.totalCoins,
          ),
        ],
      ),
      body: BottomWidgetLayout(
        bottomWidget: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingLarge,
            vertical: ThemeSize.paddingSmall,
          ),
          child: PrimaryButton(
            onPressed: () {
              Get.until((route) => Get.currentRoute == Routes.main);
            },
            child: const TitleLarge(
              "CHIUDI",
              letterSpacing: 2.0,
            ),
          ),
        ),
        child: CompletedMissionCard(
          uploadedProduct: controller.argument,
        ),
      ),
    );
  }
}
