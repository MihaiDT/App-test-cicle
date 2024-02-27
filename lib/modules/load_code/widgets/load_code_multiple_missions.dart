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
                currentCodes: 2,
                description:
                    "Acquista 3 prodotti Lines di cui almeno 1 notte /extra, riceverai un buono sconto su Zalando di 5€",
                totalCodes: 3,
                untilDate: "31/10/23",
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
                currentCodes: 0,
                description:
                    "Carica un codice Lines è e ricevi un buono sconto Sephora del valore di 5€",
                totalCodes: 3,
                untilDate: "31/10/23",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
