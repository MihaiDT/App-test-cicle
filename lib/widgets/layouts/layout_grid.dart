import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lines/core/app_theme.dart';

class LayoutGrid extends StatelessWidget {
  const LayoutGrid({
    super.key,
    this.large = false,
  });

  final bool large;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: Get.height,
      left: 0,
      top: 0,
      width: Get.width,
      child: Container(
        color: Colors.transparent,
        height: Get.height,
        padding: large ? ThemeSize.paddingM : ThemeSize.paddingS,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _column(),
            _gutter(),
            _column(),
            _gutter(),
            _column(),
            _gutter(),
            _column(),
          ],
        ),
      ),
    );
  }

  Widget _column() {
    return Expanded(
      child: Container(
        color: Colors.red.withOpacity(0.2),
        height: Get.height,
      ),
    );
  }

  Widget _gutter() {
    return SizedBox(
      height: Get.height,
      width: 20,
    );
  }
}
