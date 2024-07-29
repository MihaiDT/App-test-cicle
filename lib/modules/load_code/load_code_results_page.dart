import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/route_observer.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/load_code/controllers/load_code_result_controller.dart';
import 'package:lines/modules/load_code/widgets/completed_mission_card.dart';
import 'package:lines/modules/load_code/widgets/current_product_missions.dart';
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
        fit: StackFit.expand,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (product != null)
                    CompletedMissionCard(
                      product: product!,
                    ),
                  ThemeSizedBox.height60,


                   if (controller.currentMissionsForProduct != null)
                    ValueListenableBuilder(
                      valueListenable: controller.selectedMission,
                      builder: (context, value, child) {
                        return CurrentProductMissions(
                          missions: controller.currentMissionsForProduct!.mission,
                          groupValue: value,
                          onChanged: (mission) {
                            controller.selectedMission.value = mission;
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
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
