import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/load_code/widgets/load_code_mission_header.dart';
import 'package:lines/modules/load_code/widgets/selectable_mission_container.dart';

class LoadCodeMultipleMissions extends StatelessWidget {
  const LoadCodeMultipleMissions({
    super.key,
  });

  double get _missionContainerSize => Get.height * 0.35;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingLarge,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LoadCodeMissionHeader(
            title: "Scegli una missione",
            description:
                "Questo codice prodotto è valido per partecipare ad una delle seguenti missioni, scegli quale.",
          ),
          ThemeSizedBox.height16,
          SizedBox(
            height: _missionContainerSize,
            child: SelectableMissionContainer(
              onChanged: (value) {},
              selected: true,
              mission: Mission(
                code: 'code',
                completeCounter: 2,
                title: 'title',
                description: 'description',
                id: 1,
                imageUrl: 'imageUrl',
                isCompleted: true,
                totalCounter: 3,
                products: [],
              ),
            ),
          ),
          ThemeSizedBox.height16,
          SizedBox(
            height: _missionContainerSize,
            child: SelectableMissionContainer(
              onChanged: (value) {},
              selected: false,
              mission: Mission(
                code: 'code',
                completeCounter: 2,
                title: 'title',
                description: 'description',
                id: 1,
                imageUrl: 'imageUrl',
                isCompleted: true,
                totalCounter: 3,
                products: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
