import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class MensesDottedTileWidget extends StatelessWidget {
  final int periodDuration;
  final List<int> mensesDays;
  final List<int> ovulationDays;

  const MensesDottedTileWidget({
    required this.periodDuration,
    required this.mensesDays,
    required this.ovulationDays,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: periodDuration,
        itemBuilder: (context, index) {
          Color dotColor = ThemeColor.lightGrey;
          if (mensesDays.contains(index)) {
            dotColor = ThemeColor.menstruationColor;
          } else if (ovulationDays.contains(index)) {
            if (ovulationDays.indexOf(index) == 1) {
              dotColor = ThemeColor.ovulationColor;
            } else {
              dotColor = ThemeColor.ovulationColor.withOpacity(0.5);
            }
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 1,
            ),
            child: CircleAvatar(
              radius: 4,
              backgroundColor: dotColor,
            ),
          );
        },
      ),
    );
  }
}
