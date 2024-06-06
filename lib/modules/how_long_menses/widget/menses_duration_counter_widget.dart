import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/how_long_menses/controller/menses_duration_counter_controller.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';

class MensesDurationCounterWidget
    extends GetView<MensesDurationCounterController> {
  final Function(int) onTap;

  const MensesDurationCounterWidget({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MensesDurationCounterController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SecondaryButton(
              onPressed: () {
                controller.decrementCounter();
                onTap.call(controller.counter.value);
              },
              buttonSize: ButtonSize.h31,
              child: const TitleLarge(
                "  -  ",
              ).applyShaders(context),
            ),
            HeadlineMedium(
              "${controller.counter.value} giorni",
              fontWeight: ThemeTextStyle.weightMedium,
            ),
            SecondaryButton(
              onPressed: () {
                controller.incrementCounter();
                onTap.call(controller.counter.value);
              },
              buttonSize: ButtonSize.h31,
              child: const TitleLarge(
                "  +  ",
              ).applyShaders(context),
            ),
          ],
        );
      },
    );
  }
}
