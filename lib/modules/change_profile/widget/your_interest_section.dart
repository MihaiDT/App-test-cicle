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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DisplayMedium(
            "Interessi",
          ).applyShaders(context),
          ThemeSizedBox.height4,
          Row(
            children: [
              const BodySmall(
                "Seleziona almeno 3 interessi",
                color: ThemeColor.darkBlue,
              ),
              const Spacer(),
              if (controller.percentageValue.isNotEmpty) ...[
                Text(
                  controller.percentageValue,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    color: ThemeColor.primary,
                  ),
                ),
                ThemeSizedBox.width12,
              ],
            ],
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
      ),
    );
  }

  List<Widget> get buildChipAnswers {
    return controller.allInterests.map((interest) {
      return ChipSelectButton(
        title: interest.name,
        selected: controller.rxSelectedInterestsId.contains(interest.id),
        onPressed: () {
          controller.toggleInterest(interest.id);
        },
      );
    }).toList();
  }
}
