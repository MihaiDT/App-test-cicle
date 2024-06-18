import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/missions/controllers/missions_details_controller.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_step_one.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_step_three.dart';
import 'package:lines/modules/missions/widgets/missions_how_to_participate_step_two.dart';
import 'package:lines/modules/missions/widgets/missions_loaded_products.dart';
import 'package:lines/modules/prizes/widgets/mission_progress_indicator.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:url_launcher/url_launcher.dart';

class MissionsDetailsPage extends GetView<MissionsDetailsController> {
  const MissionsDetailsPage({
    super.key,
  });

  static const Color _bottomContainerColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        onBackPressed: () => appController.selectedMissionIndex = -1,
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                fit: StackFit.passthrough,
                children: [
                  Image.network(
                    controller.selectedMission.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: MissionProgressIndicator(
                        loadedCodes:
                            controller.selectedMission.loadedProducts.length,
                        totalCodes: controller.selectedMission.totalCounter,
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
                  horizontal: ThemeSize.paddingMedium,
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
                  horizontal: ThemeSize.paddingMedium,
                ),
                child: Html(
                  data:
                      """<div style="text-align: center !important;">${controller.selectedMission.description2 ?? ''}</div>""",
                  onLinkTap: (url, _, __) async {
                    await launchUrl(Uri.parse(url ?? ''));
                  },
                  style: {
                    "a": Style(
                      color: ThemeColor.darkBlue,
                      fontSize: FontSize(14),
                      fontWeight: FontWeight.w400,
                    ),
                    "body": Style(
                      color: ThemeColor.darkBlue,
                      fontSize: FontSize(14),
                      fontWeight: FontWeight.w400,
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
                  products: controller.selectedMission.loadedProducts,
                  totalCodes: controller.selectedMission.totalCounter,
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
                    MissionsHowToParticipateStepThree(
                      prizeDescription:
                          controller.selectedMission.prizeDescription,
                      prizeImage: controller.selectedMission.prizeImage,
                    ),
                    ThemeSizedBox.height32,
                    Html(
                      data:
                          """<div style="text-align: center !important;">${controller.selectedMission.disclaimer ?? ''}</div>""",
                      onLinkTap: (url, _, __) async {
                        await launchUrl(
                          Uri.parse(url ?? ''),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      style: {
                        "body": Style(
                          color: const Color(
                            0x1F2D4F80,
                          ).withOpacity(0.5),
                          fontSize: FontSize(10),
                          fontWeight: FontWeight.w500,
                        ),
                        "a": Style(
                          color: const Color(
                            0x1F2D4F80,
                          ).withOpacity(0.5),
                          fontSize: FontSize(10),
                          fontWeight: FontWeight.w500,
                        ),
                      },
                    ),
                    ThemeSizedBox.height16,
                    InkWell(
                      onTap: () async {
                        await launchUrl(
                          Uri.parse(
                            controller.selectedMission.regolamento ?? '',
                          ),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: const TitleMedium(
                        "REGOLAMENTO",
                        underline: true,
                        letterSpacing: 1.5,
                      ).applyShaders(context),
                    ),
                    ThemeSizedBox.height90,
                    ThemeSizedBox.height40,
                  ],
                ),
              ),
            ],
          ),
          if (!controller.selectedMission.isCompleted)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: ThemeSize.paddingSmall,
                  right: ThemeSize.paddingSmall,
                  left: ThemeSize.paddingSmall,
                ),
                child: PrimaryLoadingButton(
                  isLoading: false,
                  onPressed: () {
                    PiwikManager.trackEvent(
                      PiwikEventType.mission,
                      action: 'load code',
                      name: controller.selectedMission.title,
                    );

                    Get.toNamed(
                      Routes.loadCode,
                      arguments: controller.selectedMission,
                    );
                  },
                  child: const TitleLarge(
                    "CARICA CODICI",
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
