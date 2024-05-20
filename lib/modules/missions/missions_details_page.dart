import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/missions/controllers/missions_details_controller.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_step_one.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_step_three.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_step_two.dart';
import 'package:lines/modules/missions/widgets/missions_loaded_products.dart';
import 'package:lines/modules/prizes/widgets/mission_progress_indicator.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MissionsDetailsPage extends GetView<MissionsDetailsController> {
  const MissionsDetailsPage({
    super.key,
  });

  static const Color _bottomContainerColor = Color(0xfff3eef4);

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
            totalCoins: appController.user.value?.coinsCollected ?? 0,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 195,
                child: Image.network(
                  controller.selectedMission.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: MissionProgressIndicator(
                    loadedProducts: controller.selectedMission.totalCounter,
                  ),
                ),
              ),
            ],
          ),
          ThemeSizedBox.height16,
          TitleMedium(
            "CARICA CODICI ENTRO IL ${controller.selectedMission.endAt}",
            color: ThemeColor.brightPink,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height8,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: HeadlineLarge(
              controller.selectedMission.description,
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
          ),
          ThemeSizedBox.height8,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: Html(
              data: controller.selectedMission.description2 ?? '',
              onLinkTap: (url, _, __) async {
                await launchUrl(Uri.parse(url ?? ''));
              },
              style: {
                "body": Style(
                  color: ThemeColor.darkBlue,
                  fontSize: FontSize(16),
                  alignment: Alignment.center,
                ),
              },
            ),
          ),
          ThemeSizedBox.height24,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: MissionsLoadedProducts(
              products: [
                Product(
                  name: "Lines è",
                  points: 250,
                  category: "LINES E",
                ),
              ],
            ),
          ),
          ThemeSizedBox.height32,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            decoration: const BoxDecoration(
              color: _bottomContainerColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                ThemeSizedBox.height32,
                const DisplayMedium(
                  "Come partecipare",
                ).applyShaders(context),
                ThemeSizedBox.height16,
                MissionsHowToParticipateStepOne(
                  mission: controller.selectedMission,
                ),
                ThemeSizedBox.height16,
                const MissionsHowToParticipateStepTwo(),
                ThemeSizedBox.height16,
                const MissionsHowToParticipateStepThree(),
                ThemeSizedBox.height32,
                LabelMedium(
                  "Lorem ipsum dolor sit amet consectetur. Fames at elit congue odio nisl diam morbi. Et nunc velit ut vitae. Purus pellentesque et purus gravida at eget in. Mi tincidunt diam tincidunt curabitur nunc varius arcu.",
                  textAlign: TextAlign.center,
                  color: const Color(
                    0x1F2D4F80,
                  ).withOpacity(0.5),
                ),
                ThemeSizedBox.height16,
                InkWell(
                  onTap: () {
                    //TODO : add onTap
                  },
                  child: const TitleMedium(
                    "REGOLAMENTO",
                    underline: true,
                  ).applyShaders(context),
                ),
                ThemeSizedBox.height90,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
