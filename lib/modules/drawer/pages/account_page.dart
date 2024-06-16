import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/drawer/controller/account_page_controller.dart';
import 'package:lines/modules/drawer/sections/remove_account_section.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';

class AccountPage extends GetView<AccountPageController> {
  const AccountPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "ACCOUNT",
          color: ThemeColor.primary,
        ),
        backButtonColor: ThemeColor.darkBlue,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DisplayMedium(
              "Il tuo account My Lines",
            ).applyShaders(context),
            ThemeSizedBox.height32,
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeSize.paddingSmall,
              ),
              child: Row(
                children: [
                  const HeadlineSmall(
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
            ),
            const Divider(),
            if (controller.showPasswordSection) ...[
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.changePassword);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: ThemeSize.paddingSmall,
                  ),
                  child: Row(
                    children: [
                      const HeadlineSmall(
                        "Password",
                        color: ThemeColor.darkBlue,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        ThemeIcon.arrowRight,
                        color: ThemeColor.darkBlue,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
            ],
            ThemeSizedBox.height32,
            Align(
              alignment: Alignment.centerLeft,
              child: IntrinsicWidth(
                child: PrimaryButton(
                  buttonSize: ButtonSize.h31,
                  onPressed: () => controller.performLogout(),
                  child: const TitleLarge(
                    "LOG OUT",
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            ThemeSizedBox.height48,
            const RemoveAccountSection(),
          ],
        ),
      ),
    );
  }
}
