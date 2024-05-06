import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class MensesLineWidget extends StatelessWidget {
  final double indicatorWidth;

  const MensesLineWidget({
    required this.indicatorWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: indicatorWidth,
      decoration: BoxDecoration(
        color: ThemeColor.menstruationColor,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
