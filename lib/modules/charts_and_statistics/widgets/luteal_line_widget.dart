import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class LutealLineWidget extends StatelessWidget {
  final double indicatorWidth;

  const LutealLineWidget({
    required this.indicatorWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: indicatorWidth,
      decoration: BoxDecoration(
        color: ThemeColor.lutealColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
