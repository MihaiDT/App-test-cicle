import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/drawer/controller/account_page_controller.dart';
import 'package:lines/modules/drawer/sections/main_drawer_tile_section.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class AccountPage extends GetView<AccountPageController> {
  const AccountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "ASSISTENZA",
          color: ThemeColor.primary,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        children: [
          const DisplayMedium(
            "Il tuo account MyLines",
          ).applyShaders(context),
          ThemeSizedBox.height32,
          Row(
            children: [
              const DisplayMedium(
                "Email",
                color: ThemeColor.darkBlue,
              ),
              const Spacer(),
              BodyMedium(
                controller.email,
              ),
              SvgPicture.asset(
                ThemeIcon.lock,
              ),
            ],
          ),
          const MainDrawerTileSection(
            title: "Password",
          ),
        ],
      ),
    );
  }
}
