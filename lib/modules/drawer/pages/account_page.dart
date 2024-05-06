import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/drawer/controller/account_page_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

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
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: BottomWidgetLayout(
        scrollableAreaPadding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        bottomWidget: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
          ),
          child: PrimaryButton(
            onPressed: () {
              controller.performLogout();
            },
            child: const TitleLarge(
              "LOG OUT",
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.width8,
                SvgPicture.asset(
                  ThemeIcon.lock,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
