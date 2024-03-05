import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/layouts/app_scaffold_padding.dart';
import 'package:shimmer/shimmer.dart';

import 'package:lines/modules/home/home_controller.dart';

class HomePeriodInfoShimmer extends GetView<HomeController> {
  const HomePeriodInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return AppScaffoldPadding(
      bottom: 0,
      top: 0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 12,
              width: Get.width * 0.3,
            ),
            ThemeSizedBox.height8,
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 100,
                  ),
                ),
                ThemeSizedBox.width8,
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).padding(context);
  }
}
