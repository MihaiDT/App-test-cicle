import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/advices/advices_page.dart';
import 'package:lines/modules/drawer/pages/drawer_main_page.dart';
import 'package:lines/modules/home/home_page.dart';
import 'package:lines/modules/main/main_controller.dart';
import 'package:lines/modules/prizes/prizes_page.dart';
import 'package:lines/modules/profile/pages/profile_page.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      drawer: const DrawerMainPage(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ThemeImage.bgLight,
            ),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.onTapBottomNavigationBarMenu(
                selectedTab: value,
              );
            },
            selectedItemColor: ThemeColor.primary,
            unselectedItemColor: Colors.white,
            unselectedLabelStyle: NewThemeTextStyle.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
            selectedLabelStyle: NewThemeTextStyle.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
            elevation: 0,
            currentIndex: controller.tabIndex,
            items: [
              _navItem(
                label: 'Oggi',
                context: context,
                unselectedIcon: ThemeIcon.homeTabUnselected,
                selectedIcon: ThemeIcon.homeTabSelected,
              ),
              _navItem(
                label: 'Consigli',
                context: context,
                unselectedIcon: ThemeIcon.advicesTabUnselected,
                selectedIcon: ThemeIcon.advicesTabSelected,
              ),
              _navItem(
                label: 'Premi',
                context: context,
                unselectedIcon: ThemeIcon.prizesTabUnselected,
                selectedIcon: ThemeIcon.prizesTabSelected,
              ),
              _navItem(
                label: 'Profilo',
                context: context,
                unselectedIcon: ThemeIcon.profileTabUnselected,
                selectedIcon: ThemeIcon.profileTabSelected,
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
            print(appController.suggestedAdvicesArticle.value ?? []);
            print(appController.suggestedAdvicesArticle.value ?? []);
            print(appController.suggestedAdvicesArticle.value ?? []);
            switch (controller.tabIndex) {
              case 0:
                return const HomePage();
              case 1:
                return const AdvicesPage();
              case 2:
                return const PrizesPage();
              case 3:
                return const ProfilePage();
              default:
                return const HomePage();
            }
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem({
    required String label,
    required BuildContext context,
    required String unselectedIcon,
    required String selectedIcon,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.transparent,
      label: '',
      activeIcon: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              selectedIcon,
            ),
            BodySmall(
              label,
              fontWeight: FontWeight.w600,
            ).applyShaders(context),
          ],
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              unselectedIcon,
            ),
            BodySmall(
              label,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
