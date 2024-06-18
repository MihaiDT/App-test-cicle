import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/modules/prizes/controller/prizes_controller.dart';
import 'package:lines/modules/prizes/widgets/load_code_widget.dart';
import 'package:lines/modules/prizes/widgets/mission_container.dart';
import 'package:lines/modules/prizes/widgets/prizes_navigate_to_widget.dart';
import 'package:lines/modules/prizes/widgets/survey_section.dart';
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
                    AdjustManager.trackEvent(AjustEventType.loadProductCode);
                    PiwikManager.trackEvent(
                      PiwikEventType.loadCode,
                    );
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
                        "(${controller.missions.length})",
                        color: ThemeColor.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              ThemeSizedBox.height12,
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    controller.missions.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: SizedBox(
                          width: _missionContainerSize,
                          child: MissionContainer.withBorder(
                            onTap: () => controller.navigateToMissionDetails(
                              controller.missions[index],
                            ),
                            mission: controller.missions[index],
                            borderColor:
                                const Color(0xffF5F5F5).withOpacity(0.6),
                          ),
                        ),
                      );
                    },
                  ),
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

              /// LUCKY LINES
              Image.asset(
                "assets/images/lotteria.png",
              ),
              ThemeSizedBox.height40,
              const SurveySection(),
              ThemeSizedBox.height40,

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
                  description:
                      "Ottieni 50 Coins per ogni amico che si registra all’app My Lines",
                  title: "Invita un amico",
                  iconPath: ThemeImage.inviteAFriend,
                ),
              ),
              ThemeSizedBox.height40,
            ],
          ),
        ),
      ],
    );
  }
}
