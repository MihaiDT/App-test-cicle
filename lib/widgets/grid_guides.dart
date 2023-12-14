import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'layouts/app_scaffold_padding.dart';

class GridGuides extends StatelessWidget {
  const GridGuides({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: Get.height,
      left: 0,
      top: 0,
      width: Get.width,
      child: AppScaffoldPadding(
        bottom: 0,
        top: 0,
        child: Container(
          color: Colors.transparent,
          height: Get.height,
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
