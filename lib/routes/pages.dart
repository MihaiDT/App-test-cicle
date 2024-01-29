import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/birth_date/birth_date_binding.dart';
import 'package:lines/modules/confirm_email/confirm_email_binding.dart';
import 'package:lines/modules/confirm_email/confirm_email_page.dart';
import 'package:lines/modules/how_long_menses/binding/menses_duration_counter_binding.dart';
import 'package:lines/modules/how_long_menses/how_long_menses_page.dart';
import 'package:lines/modules/last_menses/last_menses_page.dart';
import 'package:lines/modules/name_surname/bindings/name_surname_binding.dart';
import 'package:lines/modules/welcome_quiz/bindings/welcome_quiz_binding.dart';
import 'package:lines/modules/welcome_quiz/bindings/welcome_quiz_intro_outro_binding.dart';
import 'package:lines/modules/welcome_quiz/quiz_intro_page.dart';
import 'package:lines/modules/welcome_quiz/quiz_outro_page.dart';
import 'package:lines/modules/welcome_quiz/welcome_quiz_page.dart';

import '../modules/access_wrapper/wrapper_access_widget.dart';
import '../modules/birth_date/birth_date_page.dart';
import '../modules/calendar/calendar_binding.dart';
import '../modules/calendar/calendar_page.dart';
import '../modules/cookie/cookie_page.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_page.dart';
import '../modules/name_surname/name_surname_page.dart';
import '../modules/privacy/privacy_page.dart';
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
      name: Routes.welcomeQuizIntroPage,
      bindings: [
        WelcomeQuizIntroOutroBinding(),
      ],
      page: () => _mediaQueryWrapper(const QuizIntroPage()),
    ),

    //QuizOutroPage
    GetPage(
      name: Routes.welcomeQuizOutroPage,
      bindings: [
        WelcomeQuizIntroOutroBinding(),
      ],
      page: () => _mediaQueryWrapper(const QuizOutroPage()),
    ),

    // NameSurname
    GetPage(
      name: Routes.nameSurname,
      binding: NameSurnameBinding(),
      page: () => _mediaQueryWrapper(
        const NameSurnamePage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // BirthDate
    GetPage(
      name: Routes.birthDate,
      binding: BirthDateBinding(),
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

    // LastMensesPage
    GetPage(
      name: Routes.lastMensesPage,
      page: () => _mediaQueryWrapper(
        const LastMensesPage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // HowLongMensesPage
    GetPage(
      name: Routes.howLongMensesPage,
      bindings: [
        MensesDurationCounterBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const HowLongMensesPage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    /// WelcomeQuizPage
    GetPage(
      name: Routes.welcomeQuizPage,
      bindings: [
        WelcomeQuizBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const WelcomeQuizPage(),
      ),
      transition: Transition.fade,
    ),

    ///ConfirmEmailPage
    GetPage(
      name: Routes.confirmEmailPage,
      bindings: [
        ConfirmEmailBinding(),
      ],
      page: () => _mediaQueryWrapper(
        ConfirmEmailPage(),
      ),
      transition: Transition.fade,
    )
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
