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
  final Rx<MissionCompletedArguments> args =
      appController.missionCompletedArguments;

  @override
  void onInit() {
    super.onInit();

    final Mission? mission = appController.missions.value?.firstWhereOrNull(
      (element) => element.id == args.value.mission?.id,
    );
    final UploadedProduct? uploadedProduct = args.value.uploadedProduct;

    appController.missionCompletedArguments.value = MissionCompletedArguments(
      uploadedProduct: uploadedProduct,
      mission: mission,
    );
  }

  @override
  void onReady() {
    super.onReady();
    print("MissionCompletedController onReady()");
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
