import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/advices/advices_page.dart';
import 'package:lines/modules/home/home_page.dart';
import 'package:lines/modules/main/main_controller_v2.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class MainPageV2 extends GetView<MainControllerV2> {
  const MainPageV2({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      bottomNavigationBar: Container(
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.onTapBottomNavigationBarMenu(selectedTab: value);
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: controller.tabIndex,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                label: 'home',
                activeIcon: SvgPicture.asset(ThemeIcon.homeTabSelected),
                icon: SvgPicture.asset(ThemeIcon.homeTabUnselected),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                label: 'advices',
                activeIcon: SvgPicture.asset(ThemeIcon.advicesTabSelected),
                icon: SvgPicture.asset(ThemeIcon.advicesTabUnselected),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                label: 'prizes',
                activeIcon: SvgPicture.asset(ThemeIcon.prizesTabSelected),
                icon: SvgPicture.asset(ThemeIcon.prizesTabUnselected),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                label: 'profile',
                activeIcon: SvgPicture.asset(ThemeIcon.profileTabSelected),
                icon: SvgPicture.asset(ThemeIcon.profileTabUnselected),
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      backgroundImage: ThemeDecoration.images.bgLight,
      body: SafeArea(
        child: Obx(
          () {
            switch (controller.tabIndex) {
              case 0:
                return const HomePage();
              case 1:
                return const AdvicesPage();
              default:
                return const HomePage();
            }
          },
        ),
      ),
    );
  }
}
