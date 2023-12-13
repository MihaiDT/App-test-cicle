import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/home/widgets/home_circular_period_circular_calendar.dart';
import 'package:lines/widgets/buttons/app_button.dart';

import '../../../core/app_theme.dart';
import '../../../widgets/layouts/app_scaffold_padding.dart';
import '../home_controller.dart';

class HomeCircularPeriodCalendar extends GetView<HomeController> {
  final size = Get.width * 0.74;
  HomeCircularPeriodCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPadding(
      bottom: 0,
      top: 0,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: size,
              width: size,
              child: HomeCircularPeriodCircularCalendar(),
            ),
          ),
          _avatarContainer,
        ],
      ),
    );
  }

  Widget get _avatarContainer {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size - 60),
              boxShadow: [ThemeShadow.homeAvatarContainerShadow],
              color: const Color(0xffF5F5F5).withOpacity(0.4),
            ),
            height: size - 60,
            width: size - 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                ThemeSizedBox.height4,
                Text(
                  "FASE\nMESTRUAZIONI",
                  style: ThemeTextStyle.boldSmallDark.copyWith(
                    color: const Color(0xffB438B2),
                  ),
                  textAlign: TextAlign.center,
                ),
                Obx(
                  () => Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: _avatar,
                      ),
                      if (controller.playButtonVisible)
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppButton(
                                gradient: false,
                                filled: true,
                                fullWidth: false,
                                text: "GIOCA",
                                small: true,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                ThemeSizedBox.height4,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _avatar {
    return SizedBox(
      width: 100,
      height: 140,
      child: Image.asset(
        ThemeImage.mockAvatar,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
