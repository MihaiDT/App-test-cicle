import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/delay.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/uploaded_product.dart';
import 'package:lines/modules/mission_completed/arguments/mission_completed_arguments.dart';
import 'package:lines/widgets/coin/app_coin.dart';
import 'package:lines/widgets/texts/notification_overlay.dart';

class MissionCompletedController extends GetxController {
  late final UploadedProduct uploadedProduct;
  late final Mission? mission;

  @override
  void onInit() {
    super.onInit();
    MissionCompletedArguments args = Get.arguments as MissionCompletedArguments;

    uploadedProduct = args.uploadedProduct;
    mission = args.mission;

    showNotification();
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
            padding: EdgeInsets.symmetric(vertical: 8.0),
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
