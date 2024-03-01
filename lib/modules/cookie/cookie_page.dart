import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_padding.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        actions: [
          IconButton(
            onPressed: () {
              navigateToNextPage();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundImage: ThemeDecoration.images.bgDark,
      body: SafeArea(
        child: AppScaffoldPadding(
          child: Column(
            children: [
              ThemeSizedBox.height32,
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
                "Quest'app utilizza cookie tecnici/fingerprinting di profilazione, anche di terze parti,"
                " per offrirti contenuti, servizi e pubblicità interessanti per te sulla base delle tue attività.",
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () => _onKnowMoreAboutCookies(),
                child: const BodyMedium(
                  "Clicca qui per saperne di più.",
                  textAlign: TextAlign.center,
                  underline: true,
                ),
              ),
              const BodyMedium(
                "Clicca \"acconsento\" per accettare, clicca \"più opzioni\""
                " per accettare selettivamente tutti o alcuni cookie/fingerprinting."
                " Clicca sulla X per chiudere senza prestare consenso.",
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: SecondaryButton(
                  onPressed: () {
                    navigateToNextPage();
                  },
                  child: const TitleLarge(
                    "ACCONSENTO",
                  ).applyShaders(context),
                ),
              ),
              ThemeSizedBox.height16,
              GestureDetector(
                onTap: () => _onKnowMoreAboutCookies(),
                child: const TitleMedium(
                  "PIÙ OPZIONI",
                  underline: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onKnowMoreAboutCookies() {}

  void navigateToNextPage() {
    Get.toNamed(
      appController.isLoginFlow.value == true ? Routes.login : Routes.register,
    );
  }
}
