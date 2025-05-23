import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/drawer/controller/drawer_main_page_controller.dart';
import 'package:lines/modules/drawer/sections/main_drawer_tile_section.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/coin/coin_total.dart';

class DrawerMainPage extends GetView<DrawerMainPageController> {
  const DrawerMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ThemeSizedBox.height60,
            SvgPicture.asset(
              ThemeIcon.gradientLogo,
              fit: BoxFit.scaleDown,
            ),
            ThemeSizedBox.height40,
            DisplayMedium(
              "Ciao ${controller.name}",
            ).applyShaders(context),
            ThemeSizedBox.height4,
            Align(
              alignment: Alignment.centerLeft,
              child: CoinTotal(
                totalCoins: controller.coinTotal,
                showSuffix: true,
              ),
            ),
            ThemeSizedBox.height32,
            const Divider(
              color: ThemeColor.buttonDisableBackGround,
            ),
            MainDrawerTileSection(
              title: "Account",
              leadingIcon: SvgPicture.asset(
                ThemeIcon.user,
              ),
              onTap: () {
                Get.offAndToNamed(Routes.account);
              },
            ),
            const Divider(
              color: ThemeColor.buttonDisableBackGround,
            ),
            MainDrawerTileSection(
              title: "Invita un amico",
              leadingIcon: SvgPicture.asset(
                ThemeIcon.gift,
              ),
              onTap: () {
                Get.offAndToNamed(Routes.inviteFriendPage);
              },
            ),
            const Divider(
              color: ThemeColor.buttonDisableBackGround,
            ),
            MainDrawerTileSection(
              title: "Assistenza",
              leadingIcon: SvgPicture.asset(
                ThemeIcon.questionMark,
              ),
              onTap: () {
                Get.offAndToNamed(Routes.faq);
              },
            ),
            const Divider(
              color: ThemeColor.buttonDisableBackGround,
            ),
            MainDrawerTileSection(
              title: "Impostazioni",
              leadingIcon: SvgPicture.asset(
                ThemeIcon.settings,
              ),
              onTap: () {
                Get.offAndToNamed(Routes.settings);
              },
            ),
            const Divider(
              color: ThemeColor.buttonDisableBackGround,
            ),
          ],
        ),
      ),
    );
  }
}
