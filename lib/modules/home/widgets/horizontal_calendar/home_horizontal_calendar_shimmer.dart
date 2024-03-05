import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:lines/core/app_theme.dart';

class HomeHorizontalCalendarShimmer extends StatelessWidget {
  double get _cellWidth => Get.width / 7;

  const HomeHorizontalCalendarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 90,
      width: Get.width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _shimmerDate(),
            _shimmerDate(),
            _shimmerDate(),
            _shimmerDate(),
            _shimmerDate(),
            _shimmerDate(),
            _shimmerDate(),
          ],
        ),
      ),
    );
  }

  Widget _shimmerDate() {
    return SizedBox(
      height: 100,
      width: _cellWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
            height: 10,
            width: 32,
          ),
          ThemeSizedBox.height4,
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            height: 32,
            width: 32,
          ),
        ],
      ),
    );
  }
}
