import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/load_code/widgets/selectable_mission_container.dart';

class CurrentProductMissions extends StatelessWidget {
  final List<Mission> missions;
  final Mission? groupValue;
  final Function(Mission mission) onChanged;

  const CurrentProductMissions({
    required this.missions,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(ThemeSize.paddingLarge),
      decoration: const BoxDecoration(
        color: Color(0x4DE4D8E7),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const DisplaySmall(
            "Scegli la missione",
            fontWeight: FontWeight.w500,
          ).applyShaders(context),
          ThemeSizedBox.height8,
          const BodyMedium(
            "Questo codice prodotto è valido per partecipare ad una delle seguenti missioni, scegli quale.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height16,
          ListView.separated(
            padding: const EdgeInsets.only(bottom: 90),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => ThemeSizedBox.height16,
            itemCount: missions.length,
            itemBuilder: (context, index) {
              return IntrinsicHeight(
                child: SelectableMissionContainer(
                  mission: missions[index],
                  selected: groupValue == missions[index],
                  onPressed: (_, mission) {
                    onChanged(mission);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
