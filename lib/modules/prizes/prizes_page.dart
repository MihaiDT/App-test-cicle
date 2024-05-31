import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/modules/prizes/controller/prizes_controller.dart';
import 'package:lines/modules/prizes/widgets/load_code_widget.dart';
import 'package:lines/modules/prizes/widgets/mission_container.dart';
import 'package:lines/modules/prizes/widgets/prizes_navigate_to_widget.dart';
import 'package:lines/modules/prizes/widgets/survey_card.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/cards/coin_card.dart';
import 'package:lines/widgets/coin/coin_total.dart';

class PrizesPage extends GetView<PrizesController> {
  const PrizesPage({
    super.key,
  });

  double get _missionContainerSize => Get.height * 0.3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransparentAppBar(
          leading: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Center(
              child: SvgPicture.asset(
                height: 24,
                width: 24,
                ThemeIcon.menu,
                color: ThemeColor.darkBlue,
              ),
            ),
          ),
          title: const DisplayLarge(
            "Premi",
            color: ThemeColor.primary,
          ),
          actions: [
            InkWell(
              onTap: () => Get.toNamed(Routes.infoPage),
              child: SvgPicture.asset(
                ThemeIcon.info,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              Center(
                child: CoinTotal(
                  showSuffix: true,
                  totalCoins: controller.totalCoins,
                ),
              ),
              ThemeSizedBox.height16,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: LoadCodeWidget(
                  onTap: () {
                    AdjustManager.trackEvent(EventType.loadProductCode);
                    Get.toNamed(Routes.loadCode);
                  },
                ),
              ),
              ThemeSizedBox.height24,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const DisplayMedium(
                      "Missioni in corso",
                    ).applyShaders(context),
                    ThemeSizedBox.width8,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.5),
                      child: TitleLarge(
                        "(${controller.numberOfMissions})",
                        color: ThemeColor.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              ThemeSizedBox.height12,
              SizedBox(
                height: _missionContainerSize,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  itemCount: controller.missions.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: _missionContainerSize,
                      child: MissionContainer(
                        onTap: () => controller.navigateToMissionDetails(index),
                        mission: controller.missions[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => ThemeSizedBox.width8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              ThemeSizedBox.height12,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: PrizesNavigateToWidget(
                  onTap: () => Get.toNamed(
                    Routes.missionsPage,
                  ),
                  text: "TUTTE LE MISSIONI",
                ),
              ),
              ThemeSizedBox.height40,
              if (controller.showSurveySection)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ThemeSize.paddingSmall,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const DisplayMedium(
                        "Sondaggi",
                      ).applyShaders(context),
                      ThemeSizedBox.height12,
                      const SurveyCard(
                        title: "WELCOME QUIZ",
                        description: "Raccontaci qualcosa su di te",
                        coinAmount: 25,
                      ),
                      ThemeSizedBox.height8,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: ThemeSize.paddingSmall,
                        ),
                        child: PrizesNavigateToWidget(
                          onTap: () => Get.toNamed(
                            Routes.surveysPage,
                          ),
                          text: "TUTTI I SONDAGGI",
                        ),
                      ),
                      ThemeSizedBox.height40,
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: CoinCard(
                  onTap: () => Get.toNamed(
                    Routes.inviteFriendPage,
                  ),
                  backgroundColor: Colors.white,
                  coinAmount: 50,
                  description: "Ottieni 50 Coins per ogni amico che si registra all’app My Lines",
                  title: "Invita un amico",
                  iconPath: ThemeImage.inviteAFriend,
                ),
              ),
              ThemeSizedBox.height90,
            ],
          ),
        ),
      ],
    );
  }
}
