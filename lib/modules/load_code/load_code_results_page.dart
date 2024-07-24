import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/route_observer.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/load_code/controllers/load_code_result_controller.dart';
import 'package:lines/modules/load_code/widgets/completed_mission_card.dart';
import 'package:lines/modules/load_code/widgets/selectable_mission_container.dart';
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
          Obx(
            () => CoinTotal(
              totalCoins: appController.user.value != null
                  ? appController.user.value!.coinsCollected
                  : 0,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CompletedMissionCard(
                uploadedProduct: controller.uploadedProduct!,
              ),
              ThemeSizedBox.height60,
              Expanded(
                child: Container(
                  width: Get.width,
                  color: const Color(0x11e4d8e7),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(ThemeSize.paddingLarge),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) =>
                        ThemeSizedBox.height16,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return IntrinsicHeight(
                        child: SelectableMissionContainer(
                          mission: appController.missions.value!.first,
                          selected: true,
                          onChanged: (selected) {},
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: PrimaryButton(
                onPressed: () {
                  final int backCounter =
                      RoutingObserver.routeStack.toList().indexWhere(
                            (route) =>
                                route.settings.name == '/missions_page' ||
                                route.settings.name == '/main',
                          );

                  if (backCounter == -1) {
                    Get.back();
                  } else {
                    for (int i = 0; i <= backCounter; i++) {
                      Get.back();
                    }
                  }
                },
                child: const TitleLarge(
                  "CHIUDI",
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
