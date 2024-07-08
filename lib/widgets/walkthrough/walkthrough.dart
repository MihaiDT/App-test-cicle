import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/walkthrough_data.dart';
import 'package:lines/widgets/walkthrough/controller/walkthrough_controller.dart';
import 'package:lines/widgets/walkthrough/walkthrough_body.dart';
import 'package:lines/widgets/walkthrough/walkthrough_bottom.dart';

class Walkthrough extends GetView<WalkthroughController> {
  final List<WalkthroughData> pagesData;
  final VoidCallback? onTapLetsStart;

  const Walkthrough({
    required this.pagesData,
    this.onTapLetsStart,
    super.key,
  });

  int get numberOfPages => pagesData.length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => PageView.builder(
            controller: controller.pageController,
            onPageChanged: (value) => controller.onPageChanged(value),
            physics: controller.currentStepIndex.value >= pagesData.length - 1
                ? const NeverScrollableScrollPhysics()
                : null,
            itemCount: pagesData.length,
            itemBuilder: (BuildContext context, int index) {
              return WalkthroughBody(
                data: pagesData[index],
              );
            },
          ),
        ),
        WalkthroughBottom(
          numberOfPages: numberOfPages,
          onTapLetsStart: onTapLetsStart,
        ),
      ],
    );
  }
}
