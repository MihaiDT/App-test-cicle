import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lines/core/theme/text_wrapper.dart';

import '../../../core/app_theme.dart';
import '../../../core/utils/helpers.dart';
import '../../../widgets/layouts/app_scaffold_padding.dart';
import '../home_controller.dart';

class HomePeriodInfo extends GetView<HomeController> {
  const HomePeriodInfo({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return AppScaffoldPadding(
      bottom: 0,
      top: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(
                // () => Text(
                //   _label(controller.selectedDate),
                //   style: ThemeTextStyle.boldSmallDark,
                // ),
                () => TitleMedium(
                  _label(controller.selectedDate),
                  color: ThemeColor.darkBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    ).padding(context);
  }

  /// Private method

  String _label(DateTime date) {
    final formattedDateYMD = dateFormatYMD.format(date);

    if (formattedNowYMD == formattedDateYMD) {
      return 'OGGI - ${DateFormat('dd MMMM', 'it').format(date).toUpperCase()}';
    }
    return DateFormat('EEE - dd MMMM', 'it').format(date).toUpperCase();
  }

  String get formattedNowYMD => dateFormatYMD.format(DateTime.now());
}
