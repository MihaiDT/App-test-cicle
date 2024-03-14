import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/change_profile/controller/your_menses_section_controller.dart';
import 'package:lines/modules/change_profile/widget/information_tile.dart';

class YourMensesSection extends GetView<YourMensesSectionController> {
  const YourMensesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: ThemeSize.paddingSmall,
          ),
          child: Row(
            children: [
              const DisplayMedium(
                "Il tuo ciclo",
              ).applyShaders(context),
              const Spacer(),
            ],
          ),
        ),
        ThemeSizedBox.height16,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InformationTile(
              title: "Durata mestruazioni",
              value: controller.periodDays.toString(),
            ),
            ThemeSizedBox.height8,
            InformationTile(
              title: "Sintomi",
              value: controller.periodDuration.toString(),
            ),
            ThemeSizedBox.height8,
          ],
        ),
      ],
    );
  }
}
