import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/load_code/widgets/completed_mission_card.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class LoadCodeResultsPage extends StatelessWidget {
  const LoadCodeResultsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          "CARICA CODICE",
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(
            totalCoins: 250,
          )
        ],
      ),
      body: BottomWidgetLayout(
        bottomWidget: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingLarge,
          ),
          child: PrimaryButton(
            onPressed: () {
              Get.offNamedUntil(
                Routes.main,
                (route) {
                  return route.settings.name == Routes.main;
                },
              );
            },
            child: const TitleLarge(
              "CHIUDI",
            ),
          ),
        ),
        child: CompletedMissionCard(
          earnedCoinsAmount: 250,
          onTap: () {
            // TODO: implement onTap
          },
        ),
      ),
    );
  }
}
