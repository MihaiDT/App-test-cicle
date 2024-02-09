import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/advices/advices_detail_page.dart';
import 'package:lines/modules/advices/binding/advices_detail_binding.dart';
import 'package:lines/modules/birth_date/birth_date_binding.dart';
import 'package:lines/modules/confirm_email/confirm_email_binding.dart';
import 'package:lines/modules/confirm_email/confirm_email_page.dart';
import 'package:lines/modules/cookie/cookie_page.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/binding/welcome_quiz_card_binding.dart';
import 'package:lines/modules/how_long_menses/binding/how_long_menses_binding.dart';
import 'package:lines/modules/how_long_menses/binding/menses_duration_counter_binding.dart';
import 'package:lines/modules/how_long_menses/how_long_menses_page.dart';
import 'package:lines/modules/last_menses/binding/last_menses_binding.dart';
import 'package:lines/modules/last_menses/last_menses_page.dart';
import 'package:lines/modules/login/login_binding.dart';
import 'package:lines/modules/login/login_page.dart';
import 'package:lines/modules/main/main_binding_v2.dart';
import 'package:lines/modules/main/main_page_v2.dart';
import 'package:lines/modules/name_surname/bindings/name_surname_binding.dart';
import 'package:lines/modules/privacy/privacy_binding.dart';
import 'package:lines/modules/referral/referral_binding.dart';
import 'package:lines/modules/referral/referral_page.dart';
import 'package:lines/modules/welcome_quiz/bindings/welcome_quiz_binding.dart';
import 'package:lines/modules/welcome_quiz/bindings/welcome_quiz_intro_outro_binding.dart';
import 'package:lines/modules/welcome_quiz/quiz_intro_page.dart';
import 'package:lines/modules/welcome_quiz/quiz_outro_page.dart';
import 'package:lines/modules/welcome_quiz/welcome_quiz_page.dart';

import '../modules/access_wrapper/wrapper_access_widget.dart';
import '../modules/birth_date/birth_date_page.dart';
import '../modules/calendar/calendar_binding.dart';
import '../modules/calendar/calendar_page.dart';
import '../modules/content_library/bindings/content_library_binding.dart';
import '../modules/content_library/bindings/content_library_search_page_binding.dart';
import '../modules/content_library/content_library_page.dart';
import '../modules/content_library/content_library_search_page.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_page.dart';
import '../modules/name_surname/name_surname_page.dart';
import '../modules/privacy/privacy_page.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_page.dart';
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
      name: Routes.register,
      page: () => _mediaQueryWrapper(
        const RegisterPage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // Login
    GetPage(
      binding: LoginBinding(),
      name: Routes.login,
      page: () => _mediaQueryWrapper(
        const LoginPage(),
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
      page: () => _mediaQueryWrapper(const CalendarPage()),
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
      bindings: [
        PrivacyBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const PrivacyPage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // LastMensesPage
    GetPage(
      name: Routes.lastMensesPage,
      bindings: [
        LastMensesBinding(),
      ],
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
        HowLongMensesBinding(),
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

    /// ReferralPage
    GetPage(
      name: Routes.referral,
      bindings: [
        ReferralBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const ReferralPage(),
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
        const ConfirmEmailPage(),
      ),
      transition: Transition.fade,
    ),

    ///MainV2
    GetPage(
      name: Routes.mainV2,
      bindings: [
        MainBindingV2(),
        WelcomeQuizCardBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const MainPageV2(),
      ),
      transition: Transition.fade,
    ),

    ///ContentLibrarySearchPage
    GetPage(
      name: Routes.contentLibrarySearchPage,
      bindings: [
        ContentLibrarySearchPageBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const ContentLibrarySearchPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    ///ContentLibraryPage
    GetPage(
      name: Routes.contentLibraryPage,
      bindings: [
        ContentLibraryBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const ContentLibraryPage(),
      ),
      transition: Transition.fade,
    ),

    ///ArticleDetailPage
    GetPage(
      name: Routes.articleDetailPage,
      bindings: [
        AdvicesDetailBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const AdvicesDetailPage(),
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
