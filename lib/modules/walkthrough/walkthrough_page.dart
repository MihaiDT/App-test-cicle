import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_theme.dart';
import '../../widgets/layouts/app_scaffold_page.dart';
import 'walkthrough_controller.dart';
import 'widgets/walkthrough_bottom.dart';
import 'widgets/walkthrough_step_1.dart';
import 'widgets/walkthrough_step_2.dart';
import 'widgets/walkthrough_step_3.dart';
import 'widgets/walkthrough_step_4.dart';
import 'widgets/walkthrough_step_5.dart';

class WalkthroughPage extends GetView<WalkthroughController> {
  const WalkthroughPage({super.key});

  @override
  Widget build(BuildContext context) {
    _addPostFrameCallback();

    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgWalkthrough,
      body: Stack(
        children: [
          Obx(
            () => SizedBox(
              height: controller.hBottomArea,
              width: Get.width,
              child: PageView(
                controller: controller.pageViewController,
                onPageChanged: (newIndex) => controller.onPageChanged(newIndex),
                pageSnapping: true,
                children: const [
                  WalkthroughStep1(),
                  WalkthroughStep2(),
                  WalkthroughStep3(),
                  WalkthroughStep4(),
                  WalkthroughStep5(),
                ],
              ),
            ),
          ),
          const WalkthroughBottom(),
          // GridGuides(),
        ],
      ),
    );
  }

  _addPostFrameCallback() {
    // Questa callback viene chiamato dopo che il widget è stato renderizzato
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = controller.bottomAreaKey.currentContext!.findRenderObject() as RenderBox;
      final widgetSize = renderBox.size;

      controller.hBottomArea = Get.height - widgetSize.height - ThemeSize.heightSafeAreaBottom - 24; // perché -24?
    });
  }
}
