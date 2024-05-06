import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/calendar/calendar_app_bar_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:super_tooltip/super_tooltip.dart';

class CalendarAppBar extends GetView<CalendarAppBarController>
    implements PreferredSizeWidget {
  const CalendarAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TransparentAppBar(
      actions: [
        SuperTooltip(
          arrowLength: 0,
          arrowBaseWidth: 0,
          arrowTipDistance: 20,
          showBarrier: false,
          popupDirection: TooltipDirection.left,
          minimumOutsideMargin: 0,
          controller: controller.tooltipController,
          content: SizedBox(
            width: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.onActionTap();
                    Get.toNamed(Routes.historyPage);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const HeadlineSmall(
                        "Cronologia del diario",
                        color: ThemeColor.darkBlue,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        ThemeIcon.arrowRight,
                        color: ThemeColor.primary,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    controller.onActionTap();
                    Get.toNamed(Routes.chartsAndStaticsPage);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeadlineSmall(
                        "Grafici e statistiche",
                        color: ThemeColor.darkBlue,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        ThemeIcon.arrowRight,
                        color: ThemeColor.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          child: SvgPicture.asset(
            ThemeIcon.threeDots,
            color: ThemeColor.darkBlue,
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
