import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/main/main_controller.dart';

class MainBottomNavigationBar extends StatelessWidget {
  static final double height = kBottomNavigationBarHeight +
      (ThemeSize.heightSafeAreaBottom == 0
          ? 16
          : ThemeSize.heightSafeAreaBottom) +
      8;

  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ThemeImage.bgLight,
          ),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
      height: height,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () => mainController.onTapBottomNavigationBarMenu(
                    selectedTab: 0,
                  ),
                  child: _navItem(
                    label: 'Oggi',
                    context: context,
                    icon: mainController.tabIndex == 0
                        ? ThemeIcon.homeTabSelected
                        : ThemeIcon.homeTabUnselected,
                    isSelected: mainController.tabIndex == 0,
                  ),
                ),
                InkWell(
                  onTap: () => mainController.onTapBottomNavigationBarMenu(
                    selectedTab: 1,
                  ),
                  child: _navItem(
                    label: 'Consigli',
                    context: context,
                    icon: mainController.tabIndex == 1
                        ? ThemeIcon.advicesTabSelected
                        : ThemeIcon.advicesTabUnselected,
                    isSelected: mainController.tabIndex == 1,
                  ),
                ),
                InkWell(
                  onTap: () => mainController.onTapBottomNavigationBarMenu(
                    selectedTab: 2,
                  ),
                  child: _navItem(
                    label: 'Premi',
                    context: context,
                    icon: mainController.tabIndex == 2
                        ? ThemeIcon.prizesTabSelected
                        : ThemeIcon.prizesTabUnselected,
                    isSelected: mainController.tabIndex == 2,
                  ),
                ),
                InkWell(
                  onTap: () => mainController.onTapBottomNavigationBarMenu(
                    selectedTab: 3,
                  ),
                  child: _navItem(
                    label: 'Profilo',
                    context: context,
                    icon: mainController.tabIndex == 3
                        ? ThemeIcon.profileTabSelected
                        : ThemeIcon.profileTabUnselected,
                    isSelected: mainController.tabIndex == 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required String label,
    required BuildContext context,
    required String icon,
    required bool isSelected,
  }) {
    return SizedBox(
      height: height,
      width: (Get.width - 32) / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ThemeSizedBox.height16,
          SizedBox(
            height: 30,
            width: 30,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
            ),
          ),
          isSelected
              ? TitleMedium(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).applyShaders(context)
              : TitleMedium(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
        ],
      ),
    );

    // return BottomNavigationBarItem(
    //   backgroundColor: Colors.transparent,
    //   label: '',
    //   activeIcon: Padding(
    //     padding: const EdgeInsets.only(
    //       top: 8.0,
    //     ),
    //     child: Column(
    //       children: [
    //         SvgPicture.asset(
    //           selectedIcon,
    //         ),
    //         BodySmall(
    //           label,
    //           fontWeight: FontWeight.w600,
    //         ).applyShaders(context),
    //       ],
    //     ),
    //   ),
    //   icon: Padding(
    //     padding: const EdgeInsets.only(
    //       top: 8.0,
    //     ),
    //     child: Column(
    //       children: [
    //         SvgPicture.asset(
    //           unselectedIcon,
    //         ),
    //         BodySmall(
    //           label,
    //           fontWeight: FontWeight.w600,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
