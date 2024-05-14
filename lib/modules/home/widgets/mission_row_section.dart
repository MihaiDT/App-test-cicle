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
          ),
        ),
        ThemeSizedBox.height8,
        SizedBox(
          height: controller.missionContainerSize,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            itemCount: controller.missions.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: controller.missionContainerSize,
                child: MissionContainer(
                  onTap: () => controller.navigateToMissionDetails(
                    controller.missions[index],
                  ),
                  mission: controller.missions[index],
                ),
              );
            },
            separatorBuilder: (context, index) => ThemeSizedBox.width8,
          ),
        ),
      ],
    );
  }
}
