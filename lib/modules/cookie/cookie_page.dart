import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/modules/register/register_and_login_page.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_padding.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(),
      backgroundImage: ThemeDecoration.images.bgDark,
      body: AppScaffoldPadding(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.04,
            ),
            Image.asset(
              ThemeImage.cookie,
              fit: BoxFit.contain,
            ),
            ThemeSizedBox.height32,
            const DisplayMedium(
              "Personalizza la tua\n esperienza",
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height16,
            const BodyMedium(
              "Quest’app utilizza cookie tecnici e cookie fingerprinting di profilazione, anche di terze parti, per offrirti contenuti, servizi e pubblicità interessanti per te sulla base delle tue attività.",
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {},
              child: const BodyMedium(
                "Clicca qui per saperne di più.",
                textAlign: TextAlign.center,
                underline: true,
              ),
            ),
            const Spacer(),
            SecondaryButton(
              text: "ACCONSENTO",
              onPressed: () {
                Get.toNamed(
                  Routes.registerAndLogin,
                  arguments: RegisterAndLoginPageArguments(
                    isLoginPage: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
