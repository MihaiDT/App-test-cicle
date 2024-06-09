import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/last_menses/widget/consent_bottomsheet.dart';

class LastMensesController extends GetxController {
  @override
  Future<void> onReady() async {
    await Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          image: DecorationImage(
            image: AssetImage(
              ThemeImage.consentsBottomSheetBg,
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        // child:
        // const BlurredFilter(
        //   borderRadiusDegrees: 20,
        child: Container(
          color: Colors.black26,
          child: const ConsentBottomSheet(),
        ),
        // ),
      ),
      enableDrag: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );

    appController.updateUserParameters.calendarConsent = true;

    super.onReady();
  }

  ValueNotifier<DateTimeRange?> datetimeRange = ValueNotifier(null);
}
