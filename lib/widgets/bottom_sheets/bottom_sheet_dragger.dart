import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class BottomSheetDragger extends StatelessWidget {
  const BottomSheetDragger({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ThemeColor.primaryOpaque,
          ),
          height: 4,
          width: 64,
        ),
      ],
    );
  }
}
