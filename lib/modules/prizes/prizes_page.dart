import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/mission.dart';
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

  //TODO: remove this variable when api is available
  static const int _numberOfMissions = 6;

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
            )
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              const Center(
                child: CoinTotal(
                  showSuffix: true,
                  totalCoins: 250,
                ),
              ),
              ThemeSizedBox.height16,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: LoadCodeWidget(
                  onTap: () => Get.toNamed(Routes.loadCode),
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
                    const TitleLarge(
                      "($_numberOfMissions)",
                      color: ThemeColor.darkBlue,
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
                  itemCount: 3,
                  itemBuilder: (context, index) => SizedBox(
                    width: _missionContainerSize,
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
                  separatorBuilder: (context, index) => ThemeSizedBox.width8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              ThemeSizedBox.height12,
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: PrizesNavigateToWidget(
                  text: "TUTTE LE MISSIONI",
                ),
              ),
              ThemeSizedBox.height40,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: const DisplayMedium(
                  "Sondaggi",
                ).applyShaders(context),
              ),
              ThemeSizedBox.height12,
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: SurveyCard(
                  title: "WELCOME QUIZ",
                  description: "Raccontaci qualcosa su di te",
                  coinAmount: 25,
                ),
              ),
              ThemeSizedBox.height8,
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: PrizesNavigateToWidget(
                  text: "TUTTI I SONDAGGI",
                ),
              ),
              ThemeSizedBox.height40,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ThemeSize.paddingSmall,
                ),
                child: CoinCard(
                  backgroundColor: Colors.white,
                  coinAmount: 50,
                  description:
                      "Ottieni 50 Coins per ogni amico che si registra all’app My Lines",
                  title: "Invita un amico",
                  iconPath: ThemeImage.inviteAFriend,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
