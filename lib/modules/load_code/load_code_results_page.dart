import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/route_observer.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/load_code/controllers/load_code_result_controller.dart';
import 'package:lines/modules/load_code/widgets/completed_mission_card.dart';
import 'package:lines/modules/load_code/widgets/selectable_mission_container.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';
import 'package:lines/widgets/coin/coin_total.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

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
              if (product != null)
                CompletedMissionCard(
                  product: product!,
                ),
              ThemeSizedBox.height60,
              if (controller.currentMissionsForProduct != null)
                Expanded(
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(ThemeSize.paddingLarge),
                    decoration: const BoxDecoration(
                      color: Color(0x4DE4D8E7),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        const DisplaySmall(
                          "Scegli la missione",
                          fontWeight: FontWeight.w500,
                        ).applyShaders(context),
                        ThemeSizedBox.height8,
                        const BodyMedium(
                          "Questo codice prodotto è valido per partecipare ad una delle seguenti missioni, scegli quale.",
                          color: ThemeColor.darkBlue,
                          textAlign: TextAlign.center,
                        ),
                        ThemeSizedBox.height16,
                        Expanded(
                          child: ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                ThemeSizedBox.height16,
                            itemCount: controller
                                .currentMissionsForProduct!.mission.length,
                            itemBuilder: (context, index) {
                              return Obx(
                                () {
                                  return IntrinsicHeight(
                                    child: SelectableMissionContainer(
                                      mission:
                                          appController.missions.value!.first,
                                      selected: controller
                                          .isMissionSelected(controller
                                              .currentMissionsForProduct!
                                              .mission[index])
                                          .value,
                                      onPressed: (_, mission) {
                                        controller.selectedMission =
                                            mission.obs;
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          if (controller.uploadedProduct != null)
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
          if (controller.currentMissionsForProduct != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                child: Obx(
                  () {
                    return PrimaryLoadingButton(
                      isLoading: controller.isPending.value,
                      onPressed: () {
                        controller.onSaveButtonPressed();
                      },
                      child: const TitleLarge(
                        "SALVA",
                        letterSpacing: 2.0,
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Product? get product {
    if (controller.uploadedProduct != null) {
      return controller.uploadedProduct?.product;
    } else {
      return controller.currentMissionsForProduct?.product;
    }
  }
}
