import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/mission_completed/mission_completed_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';
import 'package:lottie/lottie.dart';

class MissionCompletedPage extends GetView<MissionCompletedController> {
  const MissionCompletedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: TransparentAppBar(
        actions: [
          SizedBox(
            child: Obx(
              () => CoinTotal(
                totalCoins: appController.user.value?.coinsCollected ?? 0,
              ),
            ),
          ),
        ],
        showBackButton: false,
      ),
      backgroundImage: ThemeDecoration.images.bgCalendar,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingLarge,
          ),
          bottomWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PrimaryLoadingButton(
                  isLoading: false,
                  onPressed: () => Get.back(),
                  child: const TitleLarge(
                    "HO CAPITO",
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ThemeSizedBox.height90,
                    Transform.rotate(
                      angle: -3 *
                          (3.141592653589793 /
                              180), // Converti i gradi in radianti
                      child: _prizeImage != null
                          ? Image.network(
                              _prizeImage!,
                              fit: BoxFit.scaleDown,
                              width: Get.width * 0.55,
                            )
                          : const SizedBox.shrink(),
                    ),
                    ThemeSizedBox.height8,
                    Image.asset(
                      ThemeImage.podium,
                      fit: BoxFit.scaleDown,
                      width: Get.width * 0.5,
                    ),
                    ThemeSizedBox.height60,
                    const DisplayMedium(
                      'Missione compiuta!',
                      textAlign: TextAlign.center,
                    ).applyShaders(context),
                    ThemeSizedBox.height16,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Abbiamo appena inviato un’email al tuo indirizzo: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: ThemeColor.darkBlue,
                                ),
                          ),
                          TextSpan(
                            text: appController.user.value!.email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: ThemeColor.darkBlue,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          TextSpan(
                            text:
                                ' con tutte le informazioni relative alla disponibilità e all’utilizzo del tuo premio. Se non la ricevi, controlla nella posta indesiderata.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: ThemeColor.darkBlue,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? get _prizeImage =>
      (appController.missions.value?[appController.selectedMissionIndex])
          ?.prizeImage;

  Widget get _animation => Lottie.asset('assets/lottie/mission_completed.json');
}
