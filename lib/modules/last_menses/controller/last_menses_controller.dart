import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/last_menses/widget/consent_bottomsheet.dart';

class LastMensesController extends GetxController {
  @override
  void onReady() {
    Get.bottomSheet(
      const ConsentBottomSheet(),
      enableDrag: false,
      isDismissible: false,
      backgroundColor: ThemeColor.lightGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
    super.onReady();
  }

  ValueNotifier<DateTimeRange?> datetimeRange = ValueNotifier(null);
}
