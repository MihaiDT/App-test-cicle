import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/fullscreen_loader.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class EditCookiesPage extends StatelessWidget {
  const EditCookiesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        showBackButton: false,
        backButtonColor: ThemeColor.darkBlue,
        actions: [
          IconButton(
            onPressed: () {
              _rejectAllCookies();
              Get.back();
              showFullScreenLoader();
            },
            icon: const Icon(
              Icons.close,
              color: ThemeColor.darkBlue,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          bottomWidget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PrimaryButton(
                  onPressed: () {
                    _acceptAllCookies();
                    Get.back();
                    showFullScreenLoader();
                  },
                  child: const TitleLarge(
                    "ACCONSENTO",
                  ),
                ),
                ThemeSizedBox.height16,
                InkWell(
                  onTap: () => _onKnowMoreAboutCookies(),
                  child: const TitleMedium(
                    "PIÙ OPZIONI",
                    underline: true,
                    letterSpacing: 1.5,
                    textAlign: TextAlign.center,
                  ).applyShaders(context),
                ),
              ],
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                ThemeImage.cookie,
                fit: BoxFit.contain,
              ),
              ThemeSizedBox.height32,
              const DisplayMedium(
                "Personalizza la tua\n esperienza",
                textAlign: TextAlign.center,
              ).applyShaders(context),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Quest'app utilizza cookie tecnici/fingerprinting di profilazione, anche di terze parti,"
                " per offrirti contenuti, servizi e pubblicità interessanti per te sulla base delle tue attività.",
                textAlign: TextAlign.center,
                color: ThemeColor.darkBlue,
              ),
              ThemeSizedBox.height16,
              InkWell(
                onTap: () => _onKnowMoreAboutCookies(),
                child: const BodyMedium(
                  "Clicca qui per saperne di più.",
                  textAlign: TextAlign.center,
                  color: ThemeColor.darkBlue,
                  underline: true,
                ),
              ),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Clicca \"acconsento\" per accettare, clicca \"più opzioni\""
                " per accettare selettivamente tutti o alcuni cookie/fingerprinting."
                " Clicca sulla X per chiudere senza prestare consenso.",
                textAlign: TextAlign.center,
                color: ThemeColor.darkBlue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onKnowMoreAboutCookies() {
    Get.toNamed(Routes.cookiesFingerprinting, arguments: true);
  }

  Future<void> _rejectAllCookies() async {
    HiveManager.hasAcceptedCookieStats = false;
    HiveManager.hasAcceptedCookieProfiling = false;
    await _updateConsents();
  }

  Future<void> _acceptAllCookies() async {
    HiveManager.hasAcceptedCookieStats = true;
    HiveManager.hasAcceptedCookieProfiling = true;
    await _updateConsents();
  }

  Future<void> _updateConsents() async {
    await AuthenticationService.updatePrivacy(
      UpdateUserParameters(
        hasConsentCookieProfiling: HiveManager.hasAcceptedCookieProfiling,
        hasConsentCookieStats: HiveManager.hasAcceptedCookieStats,
      ),
    );
  }

  void navigateToNextPage() {
    Get.offAndToNamed(
      appController.isLoginFlow.value == true ? Routes.login : Routes.register,
    );
  }
}
