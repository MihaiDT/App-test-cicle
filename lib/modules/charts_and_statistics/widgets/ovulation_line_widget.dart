import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class OvulationLineWidget extends StatelessWidget {
  final double indicatorWidth;

  const OvulationLineWidget({
    required this.indicatorWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 2,
          width: indicatorWidth,
          decoration: BoxDecoration(
            color: ThemeColor.ovulationColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        CircleAvatar(
          radius: 3,
          backgroundColor: ThemeColor.ovulationColor,
        ),
      ],
    );
  }
}
