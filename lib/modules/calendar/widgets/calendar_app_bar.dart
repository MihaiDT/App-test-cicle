import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/calendar/calendar_app_bar_controller.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class CalendarAppBar extends GetView<CalendarAppBarController>
    implements PreferredSizeWidget {
  const CalendarAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calendarController = Get.find<CalendarController>();

    return TransparentAppBar(
      actions: [
        InkWell(
          onTap: () => calendarController.showTooltip.value =
              !calendarController.showTooltip.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              ThemeIcon.threeDots,
              color: ThemeColor.darkBlue,
              height: 20,
            ),
          ),
        ),
      ],
      backButtonColor: ThemeColor.darkBlue,
      title: const TitleLarge(
        'CALENDARIO',
        color: ThemeColor.darkBlue,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
