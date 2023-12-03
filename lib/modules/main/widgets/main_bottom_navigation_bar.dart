import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../../../core/utils/helpers.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({super.key});

  static const double height = kBottomNavigationBarHeight + 32; // 88 su iPhone

  @override
  Widget build(BuildContext context) {
    logDebug("$height");
    return Container(
      decoration: BoxDecoration(
        image: ThemeDecoration.images.bgMainBottomNavigationBar,
        color: Colors.white,
      ),
      height: height,
      width: double.maxFinite,
    );
  }
}
