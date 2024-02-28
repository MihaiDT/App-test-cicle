import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/prizes/widgets/mission_container.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class MissionsPage extends StatelessWidget {
  const MissionsPage({
    super.key,
  });

  static final double _containerHeight = Get.height * 0.35;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          "MISSIONI",
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(totalCoins: 250),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: TitleMedium(
              "IN CORSO",
              color: ThemeColor.darkBlue,
            ),
          ),
          ThemeSizedBox.height8,
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) => SizedBox(
              height: _containerHeight,
              child: MissionContainer(
                mission: Mission(
                  currentCodes: 2,
                  description:
                      "Acquista 3 prodotti Lines di cui almeno 1 notte /extra, riceverai un buono sconto su Zalando di 5€",
                  totalCodes: 3,
                  untilDate: "31/10/23",
                ),
              ),
            ),
            separatorBuilder: (context, index) => ThemeSizedBox.height16,
          ),
          ThemeSizedBox.height8,
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: TitleMedium(
              "PROSSIME MISSIONI",
              color: ThemeColor.darkBlue,
            ),
          ),
          ThemeSizedBox.height8,
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) => SizedBox(
              height: _containerHeight,
              child: MissionContainer(
                mission: Mission(
                  currentCodes: 2,
                  description:
                      "Acquista 3 prodotti Lines di cui almeno 1 notte /extra, riceverai un buono sconto su Zalando di 5€",
                  totalCodes: 3,
                  untilDate: "31/10/23",
                ),
              ),
            ),
            separatorBuilder: (context, index) => ThemeSizedBox.height16,
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
