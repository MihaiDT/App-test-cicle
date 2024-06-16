import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/home/controllers/mission_row_section_controller.dart';
import 'package:lines/modules/prizes/widgets/mission_container.dart';

class MissionRowSection extends GetView<MissionRowSectionController> {
  const MissionRowSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: TitleMedium(
            "MISSIONI IN CORSO",
            color: ThemeColor.darkBlue,
            letterSpacing: 2,
          ),
        ),
        ThemeSizedBox.height8,
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              controller.missions.length,
              (index) {
                return SizedBox(
                  width: controller.missionContainerSize,
                  child: MissionContainer.withBorder(
                    onTap: () => controller.navigateToMissionDetails(index),
                    mission: controller.missions[index],
                    borderColor: const Color(0xffd7c3e8),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
