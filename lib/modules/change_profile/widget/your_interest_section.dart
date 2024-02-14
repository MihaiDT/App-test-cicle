import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/change_profile/controller/your_interests_section_controller.dart';
import 'package:lines/modules/welcome_quiz/widgets/chip_select_button.dart';

class YourInterestSection extends GetView<YourInterestsSectionController> {
  const YourInterestSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DisplayMedium(
          "Interessi",
        ).applyShaders(context),
        ThemeSizedBox.height4,
        const BodySmall(
          "Seleziona almeno 3 interessi",
          color: ThemeColor.darkBlue,
        ),
        ThemeSizedBox.height16,
        Obx(
          () => Wrap(
            spacing: 8,
            runSpacing: 8,
            children: buildChipAnswers,
          ),
        ),
      ],
    );
  }

  List<Widget> get buildChipAnswers {
    return controller.interests.map((value) {
      return ChipSelectButton(
        title: value,
        selected: controller.selectedInterests.contains(value),
        onPressed: () {
          controller.toggleInterest(value);
        },
      );
    }).toList();
  }
}
