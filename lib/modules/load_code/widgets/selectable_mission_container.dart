import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/prizes/widgets/mission_container.dart';

class SelectableMissionContainer extends StatelessWidget {
  final Mission mission;
  final Function(bool, Mission) onPressed;
  final bool selected;

  const SelectableMissionContainer({
    required this.mission,
    required this.onPressed,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed(!selected, mission);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          selected
              ? MissionContainer.withBorder(
                  mission: mission,
                  gradientBorder: ThemeGradient.primary,
                )
              : MissionContainer(
                  mission: mission,
                ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: !selected
                      ? GradientBoxBorder(
                          gradient: ThemeGradient.primary,
                          width: 2,
                        )
                      : null,
                ),
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: Visibility(
                    visible: selected,
                    child: SvgPicture.asset(
                      ThemeIcon.checkMarkGradient,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
