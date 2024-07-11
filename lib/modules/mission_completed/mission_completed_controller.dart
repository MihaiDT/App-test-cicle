import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/delay.dart';
import 'package:lines/core/helpers/logger/log.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/widgets/coin/app_coin.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class MissionCompletedController extends GetxController {
  Mission get selectedMission => appController.missions.value!.firstWhere(
        (item) => item.id == appController.selectedMissionId.value,
      );

  @override
  void onReady() {
    super.onReady();
    logDebug("MissionCompletedController onReady()");

    appController.selectedMissionId.refresh();
  }

  Future<void> showNotification() async {
    await wait(milliseconds: 1500);

    FlushBar(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: HeadlineSmall(
              "Codice prodotto caricato",
              color: Color(0xff1F2D4F),
            ),
          ),
          AppCoin(
            coinAmount:
                appController.missions.value!.first.products.first.points,
          ),
        ],
      ),
    ).show(Get.context!);
  }
}
