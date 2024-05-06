import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class FollicularLineWidget extends StatelessWidget {
  final double indicatorWidth;

  const FollicularLineWidget({
    required this.indicatorWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: indicatorWidth,
      decoration: BoxDecoration(
        color: ThemeColor.follicularColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
