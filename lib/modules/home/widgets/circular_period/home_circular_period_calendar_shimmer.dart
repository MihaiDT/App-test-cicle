import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/home/widgets/horizontal_calendar/home_horizontal_calendar_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class HomeCircularPeriodCalendarShimmer extends StatelessWidget {
  const HomeCircularPeriodCalendarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Get.width * 0.74;

    return Column(
      children: [
        const HomeHorizontalCalendarShimmer(),
        Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size),
                color: Colors.white,
              ),
              height: size,
              width: size,
            ),
          ),
        ),
      ],
    );
  }
}
