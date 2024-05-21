import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/info/widgets/info_bottom_sheet.dart';

class InfoController extends GetxController {
  int get totalCoins => appController.user.value?.coinsCollected ?? 0;

  void showBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      constraints: BoxConstraints(maxHeight: Get.height * 0.85),
      context: context,
      isScrollControlled: true,
      builder: (_) => InfoBottomSheet(
        child: child,
      ),
    );
  }
}
