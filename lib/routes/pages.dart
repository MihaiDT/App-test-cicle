import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/access_wrapper/wrapper_access_widget.dart';
import '../modules/birth_date/birth_date_binding.dart';
import '../modules/birth_date/birth_date_page.dart';
import '../modules/calendar/calendar_binding.dart';
import '../modules/calendar/calendar_page.dart';
import '../modules/cookie/cookie_page.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_page.dart';
import '../modules/name_surname/name_surname_page.dart';
import '../modules/privacy/privacy_page.dart';
import '../modules/quiz/widgets/quiz_intro_page.dart';
import '../modules/quiz/widgets/quiz_outro_page.dart';
import '../modules/register/register_and_login_page.dart';
import '../modules/register/register_binding.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import '../modules/walkthrough/walkthrough_binding.dart';
import '../modules/walkthrough/walkthrough_page.dart';
import 'routes.dart';

class Pages {
  Pages._(); // this is to prevent anyone from instantiating this object

  static final List<GetPage<Pages>> pages = [
    // Main
    GetPage(
      binding: MainBinding(),
      name: Routes.main,
      page: () => _mediaQueryWrapper(
        const MainPage(),
      ),
      transition: Transition.fadeIn,
    ),

    // Splash
    GetPage(
      binding: SplashBinding(),
      name: Routes.logo,
      page: () => _mediaQueryWrapper(
        const SplashPage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // Walkthrough
    GetPage(
      binding: WalkthroughBinding(),
      name: Routes.walkthrough,
      page: () => _mediaQueryWrapper(const WalkthroughPage()),
      transition: Transition.fade,
    ),

    // Register
    GetPage(
      binding: RegisterBinding(),
      name: Routes.registerAndLogin,
      page: () => _mediaQueryWrapper(
        RegisterAndLoginPage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // Cookie
    GetPage(
      name: Routes.cookie,
      page: () => _mediaQueryWrapper(
        const CookiePage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    //Calendar
    GetPage(
      binding: CalendarBinding(),
      name: Routes.calendar,
      page: () => _mediaQueryWrapper(CalendarPage()),
      transition: Transition.fade,
    ),

    //QuizIntroPage
    GetPage(
      name: Routes.quizIntroPage,
      page: () => _mediaQueryWrapper(const QuizIntroPage()),
    ),

    //QuizOutroPage
    GetPage(
      name: Routes.quizOutroPage,
      page: () => _mediaQueryWrapper(const QuizOutroPage()),
    ),

    // NameSurname
    GetPage(
      name: Routes.nameSurname,
      binding: BirthDateBinding(),
      page: () => _mediaQueryWrapper(
        NameSurnamePage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // BirthDate
    GetPage(
      name: Routes.birthDate,
      page: () => _mediaQueryWrapper(
        const BirthDatePage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // PrivacyPage
    GetPage(
      name: Routes.privacy,
      page: () => _mediaQueryWrapper(
        const PrivacyPage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),
  ];

  /// Private methods

  static MediaQuery _mediaQueryWrapper(
    Widget view, {
    bool authNeeded = true,
  }) {
    return MediaQuery(
      data: MediaQuery.of(Get.context!).copyWith(
        textScaler: const TextScaler.linear(1),
      ),
      child: WrapperAccessWidget(
        authNeeded: authNeeded,
        child: view,
      ),
    );
  }
}
