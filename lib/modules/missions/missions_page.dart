import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/missions/controllers/missions_controller.dart';
import 'package:lines/modules/prizes/widgets/mission_container.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class MissionsPage extends GetView<MissionsController> {
  const MissionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleMedium(
          "MISSIONI",
          color: ThemeColor.darkBlue,
        ),
        actions: [
          CoinTotal(
            totalCoins: controller.totalCoins,
          ),
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
          Obx(
            () => ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingSmall,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.missions.length,
              itemBuilder: (context, index) {
                return MissionContainer(
                  onTap: () => controller.navigateToMissionDetails(
                    controller.missions[index],
                  ),
                  mission: controller.missions[index],
                );
              },
              separatorBuilder: (context, index) => ThemeSizedBox.height16,
            ),
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
