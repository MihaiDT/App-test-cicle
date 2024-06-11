import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/advices/advices_page.dart';
import 'package:lines/modules/drawer/pages/drawer_main_page.dart';
import 'package:lines/modules/home/home_page.dart';
import 'package:lines/modules/main/main_controller.dart';
import 'package:lines/modules/main/widgets/main_bottom_navigation_bar.dart';
import 'package:lines/modules/prizes/prizes_page.dart';
import 'package:lines/modules/profile/pages/profile_page.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: PopScope(
        canPop: false,
        child: AppScaffoldPage(
          drawer: const DrawerMainPage(),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ThemeImage.bgLight,
                ),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: const MainBottomNavigationBar(),
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
        ),
      ),
    );
  }
}
