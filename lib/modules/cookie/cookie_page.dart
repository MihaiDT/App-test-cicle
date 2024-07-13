import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({
    super.key,
  });

  // void _requestAppTrackingTransparencyPermission() async {
  //   if (Platform.isIOS) {
  //     // Wait for dialog popping animation
  //     await Future.delayed(const Duration(milliseconds: 200));
  //     await AppTrackingTransparency.requestTrackingAuthorization();
  //   }
  // }

  // Future<bool> _isAppTrackingTransparencyPermissionAccepted() async {
  //   if (Platform.isIOS) {
  //     return await AppTrackingTransparency.requestTrackingAuthorization() == TrackingStatus.authorized;
  //   }
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    // _requestAppTrackingTransparencyPermission();

    return AppScaffoldPage(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar(
        showBackButton: false,
        actions: [
          IconButton(
            onPressed: () {
              rejectAllCookies();
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
                SecondaryButton(
                  onPressed: () {
                    acceptAllCookies();
                    navigateToNextPage();
                  },
                  child: const TitleLarge(
                    "ACCONSENTO",
                    letterSpacing: 2,
                  ).applyShaders(context),
                ),
                ThemeSizedBox.height16,
                InkWell(
                  onTap: () => _onKnowMoreAboutCookies(),
                  child: const TitleMedium(
                    "PIÙ OPZIONI",
                    underline: true,
                    letterSpacing: 1.5,
                    textAlign: TextAlign.center,
                  ),
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
              ),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Quest'app utilizza cookie tecnici/fingerprinting di profilazione, anche di terze parti,"
                " per offrirti contenuti, servizi e pubblicità interessanti per te sulla base delle tue attività.",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height16,
              InkWell(
                onTap: () => _onKnowMoreAboutCookies(),
                child: const BodyMedium(
                  "Clicca qui per saperne di più.",
                  textAlign: TextAlign.center,
                  underline: true,
                ),
              ),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Clicca \"acconsento\" per accettare, clicca \"più opzioni\""
                " per accettare selettivamente tutti o alcuni cookie/fingerprinting."
                " Clicca sulla X per chiudere senza prestare consenso.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onKnowMoreAboutCookies() {
    Get.toNamed(
      Routes.cookiesFingerprinting,
      arguments: false,
    );
  }

  void rejectAllCookies() {
    HiveManager.hasAcceptedCookieStats = false;
    HiveManager.hasAcceptedCookieProfiling = false;

    PiwikManager.trackEvent(
      PiwikEventType.registration,
      action: 'step 3 - cookie consent',
      name: 'no consent',
    );
  }

  void acceptAllCookies() {
    HiveManager.hasAcceptedCookieStats = true;
    HiveManager.hasAcceptedCookieProfiling = true;

    PiwikManager.trackEvent(
      PiwikEventType.registration,
      action: 'step 3 - cookie consent',
      name: 'profiling',
    );
  }

  void navigateToNextPage() {
    Get.offAndToNamed(
      appController.isLoginFlow.value == true ? Routes.login : Routes.register,
    );
  }
}
