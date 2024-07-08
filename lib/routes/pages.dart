import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/badges/bindings/badges_binding.dart';
import 'package:lines/badges/bindings/completed_badges_binding.dart';
import 'package:lines/badges/bindings/in_progress_badges_binding.dart';
import 'package:lines/badges/pages/badges_page.dart';
import 'package:lines/modules/access_wrapper/wrapper_access_widget.dart';
import 'package:lines/modules/advices/advices_detail_page.dart';
import 'package:lines/modules/advices/binding/advices_detail_binding.dart';
import 'package:lines/modules/birth_date/birth_date_binding.dart';
import 'package:lines/modules/birth_date/birth_date_page.dart';
import 'package:lines/modules/calendar/calendar_app_bar_binding.dart';
import 'package:lines/modules/calendar/calendar_binding.dart';
import 'package:lines/modules/calendar/calendar_page.dart';
import 'package:lines/modules/change_profile/binding/customize_cherry_binding.dart';
import 'package:lines/modules/change_profile/binding/your_information_section_binding.dart';
import 'package:lines/modules/change_profile/binding/your_interests_section_binding.dart';
import 'package:lines/modules/change_profile/binding/your_menses_section_binding.dart';
import 'package:lines/modules/change_profile/pages/change_profile_page.dart';
import 'package:lines/modules/charts_and_statistics/charts_and_statistics_bindings.dart';
import 'package:lines/modules/charts_and_statistics/charts_and_statistics_page.dart';
import 'package:lines/modules/confirm_email/confirm_email_binding.dart';
import 'package:lines/modules/confirm_email/confirm_email_page.dart';
import 'package:lines/modules/confirm_tutor_email/confirm_tutor_email.dart';
import 'package:lines/modules/confirm_tutor_email/confirm_tutor_email_binding.dart';
import 'package:lines/modules/consents/consents_binding.dart';
import 'package:lines/modules/consents/consents_page.dart';
import 'package:lines/modules/content_library/bindings/content_library_binding.dart';
import 'package:lines/modules/content_library/bindings/content_library_search_page_binding.dart';
import 'package:lines/modules/content_library/content_library_category_page.dart';
import 'package:lines/modules/content_library/content_library_page.dart';
import 'package:lines/modules/content_library/content_library_search_page.dart';
import 'package:lines/modules/cookie/cookie_page.dart';
import 'package:lines/modules/cookies_fingerprinting/cookies_fingerprinting_binding.dart';
import 'package:lines/modules/cookies_fingerprinting/cookies_fingerprinting_page.dart';
import 'package:lines/modules/customize_cherry_web_view/customize_cherry_web_view.dart';
import 'package:lines/modules/diary_data_details/diary_data_details_binding.dart';
import 'package:lines/modules/diary_data_details/diary_data_details_page.dart';
import 'package:lines/modules/drawer/binding/account_binding.dart';
import 'package:lines/modules/drawer/binding/change_password_binding.dart';
import 'package:lines/modules/drawer/binding/drawer_main_page_binding.dart';
import 'package:lines/modules/drawer/pages/account_page.dart';
import 'package:lines/modules/drawer/pages/change_password_page.dart';
import 'package:lines/modules/drawer/pages/faq_page.dart';
import 'package:lines/modules/edit_cookies/edit_cookies_page.dart';
import 'package:lines/modules/game_quiz/game_quiz_binding.dart';
import 'package:lines/modules/game_quiz/game_quiz_page.dart';
import 'package:lines/modules/history/history_binding.dart';
import 'package:lines/modules/history/history_page.dart';
import 'package:lines/modules/home/bindings/mission_row_section_binding.dart';
import 'package:lines/modules/home/home_binding.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/binding/welcome_quiz_card_binding.dart';
import 'package:lines/modules/how_long_menses/binding/how_long_menses_binding.dart';
import 'package:lines/modules/how_long_menses/binding/menses_duration_counter_binding.dart';
import 'package:lines/modules/how_long_menses/how_long_menses_page.dart';
import 'package:lines/modules/info/binding/info_binding.dart';
import 'package:lines/modules/info/binding/info_dropdown_result_binding.dart';
import 'package:lines/modules/info/info_dropdown_results_page.dart';
import 'package:lines/modules/info/info_page.dart';
import 'package:lines/modules/invite_friend/invite_friend_binding.dart';
import 'package:lines/modules/invite_friend/invite_friend_page.dart';
import 'package:lines/modules/last_menses/accept_consent_page.dart';
import 'package:lines/modules/last_menses/binding/accept_consent_binding.dart';
import 'package:lines/modules/last_menses/binding/last_menses_binding.dart';
import 'package:lines/modules/last_menses/last_menses_page.dart';
import 'package:lines/modules/load_code/binding/load_code_binding.dart';
import 'package:lines/modules/load_code/binding/load_code_result_binding.dart';
import 'package:lines/modules/load_code/load_code_page.dart';
import 'package:lines/modules/load_code/load_code_results_page.dart';
import 'package:lines/modules/login/login_binding.dart';
import 'package:lines/modules/login/login_page.dart';
import 'package:lines/modules/main/main_binding.dart';
import 'package:lines/modules/main/main_page.dart';
import 'package:lines/modules/mission_completed/mission_completed_binding.dart';
import 'package:lines/modules/mission_completed/mission_completed_page.dart';
import 'package:lines/modules/missions/bindings/missions_binding.dart';
import 'package:lines/modules/missions/bindings/missions_details_binding.dart';
import 'package:lines/modules/missions/missions_details_page.dart';
import 'package:lines/modules/missions/missions_page.dart';
import 'package:lines/modules/name_surname/bindings/name_surname_binding.dart';
import 'package:lines/modules/name_surname/name_surname_page.dart';
import 'package:lines/modules/privacy/privacy_binding.dart';
import 'package:lines/modules/privacy/privacy_page.dart';
import 'package:lines/modules/privacy_details/privacy_details_binding.dart';
import 'package:lines/modules/privacy_details/privacy_details_page.dart';
import 'package:lines/modules/prizes_onboarding/prizes_onboarding_page.dart';
import 'package:lines/modules/profile/bindings/my_badges_binding.dart';
import 'package:lines/modules/profile/bindings/my_menses_section_binding.dart';
import 'package:lines/modules/profile/bindings/profile_completion_percentage_binding.dart';
import 'package:lines/modules/profile/bindings/profile_header_binding.dart';
import 'package:lines/modules/profile/bindings/your_diary_section_binding.dart';
import 'package:lines/modules/referral/referral_binding.dart';
import 'package:lines/modules/referral/referral_page.dart';
import 'package:lines/modules/register/register_binding.dart';
import 'package:lines/modules/register/register_page.dart';
import 'package:lines/modules/settings/settings_binding.dart';
import 'package:lines/modules/settings/settings_page.dart';
import 'package:lines/modules/specific_menses_stats/specific_menses_stats_binding.dart';
import 'package:lines/modules/specific_menses_stats/specific_menses_stats_page.dart';
import 'package:lines/modules/splash/splash_binding.dart';
import 'package:lines/modules/splash/splash_page.dart';
import 'package:lines/modules/surveys/survey_binding.dart';
import 'package:lines/modules/surveys/surveys_page.dart';
import 'package:lines/modules/tamagotchi/tamagochi_web_view.dart';
import 'package:lines/modules/tutor_email/tutor_email_binding.dart';
import 'package:lines/modules/tutor_email/tutor_email_page.dart';
import 'package:lines/modules/welcome/welcome_binding.dart';
import 'package:lines/modules/welcome/welcome_page.dart';
import 'package:lines/modules/welcome_quiz/bindings/welcome_quiz_binding.dart';
import 'package:lines/modules/welcome_quiz/bindings/welcome_quiz_intro_binding.dart';
import 'package:lines/modules/welcome_quiz/bindings/welcome_quiz_outro_binding.dart';
import 'package:lines/modules/welcome_quiz/quiz_intro_page.dart';
import 'package:lines/modules/welcome_quiz/quiz_outro_page.dart';
import 'package:lines/modules/welcome_quiz/welcome_quiz_page.dart';
import 'package:lines/modules/welcome_walkthrough/welcome_walkthrough_page.dart';
import 'package:lines/modules/your_coins/your_coins_page.dart';
import 'package:lines/modules/your_diary/bindings/your_diary_binding.dart';
import 'package:lines/modules/your_diary/pages/your_diary_page.dart';
import 'package:lines/modules/your_menses_stats/your_menses_stats_binding.dart';
import 'package:lines/modules/your_menses_stats/your_menses_stats_page.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/walkthrough/walkthrough_binding.dart';

class Pages {
  Pages._(); // this is to prevent anyone from instantiating this object

  static final List<GetPage<Pages>> pages = [
    // Splash
    GetPage(
      bindings: [
        SplashBinding(),
      ],
      name: Routes.logo,
      page: () => _mediaQueryWrapper(
        const SplashPage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
    ),

    // WelcomePage
    GetPage(
      name: Routes.welcome,
      bindings: [
        WelcomeBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const WelcomePage(),
        authNeeded: false,
      ),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Register
    GetPage(
      binding: RegisterBinding(),
      name: Routes.register,
      page: () => _mediaQueryWrapper(
        const RegisterPage(),
        authNeeded: false,
      ),
      transition: Transition.rightToLeft,
    ),

    // Login
    GetPage(
      binding: LoginBinding(),
      name: Routes.login,
      page: () => _mediaQueryWrapper(
        const LoginPage(),
        authNeeded: false,
      ),
      transition: Transition.rightToLeft,
    ),

    // Cookie
    GetPage(
      name: Routes.cookie,
      page: () => _mediaQueryWrapper(
        const CookiePage(),
        authNeeded: false,
      ),
      transition: Transition.downToUp,
    ),

    //Calendar
    GetPage(
      bindings: [
        CalendarBinding(),
        CalendarAppBarBinding(),
      ],
      name: Routes.calendar,
      page: () => _mediaQueryWrapper(const CalendarPage()),
      transition: Transition.rightToLeft,
    ),

    //QuizIntroPage
    GetPage(
      name: Routes.welcomeQuizIntroPage,
      bindings: [
        WelcomeQuizIntroBinding(),
      ],
      page: () => _mediaQueryWrapper(const QuizIntroPage()),
    ),

    //QuizOutroPage
    GetPage(
      name: Routes.welcomeQuizOutroPage,
      bindings: [
        WelcomeQuizOutroBinding(),
      ],
      page: () => _mediaQueryWrapper(const QuizOutroPage()),
      transition: Transition.rightToLeft,
    ),

    // NameSurname
    GetPage(
      name: Routes.nameSurname,
      binding: NameSurnameBinding(),
      page: () => _mediaQueryWrapper(
        const NameSurnamePage(),
        authNeeded: false,
      ),
      transition: Transition.rightToLeft,
    ),

    // BirthDate
    GetPage(
      name: Routes.birthDate,
      binding: BirthDateBinding(),
      page: () => _mediaQueryWrapper(
        const BirthDatePage(),
        authNeeded: false,
      ),
      transition: Transition.rightToLeft,
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
      transition: Transition.rightToLeft,
    ),

    // LastMensesPage
    GetPage(
      name: Routes.lastMensesPage,
      bindings: [
        LastMensesBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const LastMensesPage(),
      ),
      transition: Transition.rightToLeft,
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
      transition: Transition.rightToLeft,
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
      transition: Transition.rightToLeft,
    ),

    /// GameQuizPage
    GetPage(
      name: Routes.gameQuiz,
      bindings: [
        GameQuizBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const GameQuizPage(),
      ),
      transition: Transition.downToUp,
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
      transition: Transition.rightToLeft,
    ),

    ///ConfirmEmailPage
    GetPage(
      name: Routes.confirmEmailPage,
      bindings: [
        ConfirmEmailBinding(),
      ],
      page: () => _mediaQueryWrapper(
        authNeeded: false,
        const ConfirmEmailPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// Main
    GetPage(
      name: Routes.main,
      bindings: [
        HomeBinding(),
        MainBinding(),
        WelcomeQuizCardBinding(),
        YourDiarySectionBinding(),
        ProfileHeaderBinding(),
        MyMensesSectionBinding(),
        DrawerMainPageBinding(),
        ProfileCompletionPercentageBinding(),
        MyBadgesBinding(),
        MissionRowSectionBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const MainPage(),
      ),
      transition: Transition.rightToLeft,
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
      transition: Transition.rightToLeft,
    ),

    ///FaqPage
    GetPage(
      name: Routes.faq,
      page: () => _mediaQueryWrapper(
        const FaqPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    ///AccountPage
    GetPage(
      name: Routes.account,
      binding: AccountBinding(),
      page: () => _mediaQueryWrapper(
        const AccountPage(),
      ),
      transition: Transition.rightToLeft,
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
      transition: Transition.rightToLeft,
    ),

    ///ChangeProfilePage
    GetPage(
      name: Routes.changeProfilePage,
      bindings: [
        CustomizeCherryBinding(),
        YourInformationSectionBinding(),
        YourMensesSectionBinding(),
        YourInterestsSectionBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const ChangeProfilePage(),
      ),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.contentLibraryCategoryPage,
      page: () => _mediaQueryWrapper(
        const ContentLibraryCategoryPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// WelcomeWalkthrough
    GetPage(
      name: Routes.welcomeWalkthrough,
      binding: WalkthroughBinding(),
      page: () => _mediaQueryWrapper(
        const WelcomeWalkthroughPage(),
      ),
      transition: Transition.fade,
    ),

    /// WelcomeWalkthrough
    GetPage(
      name: Routes.badges,
      bindings: [
        BadgesBinding(),
        CompletedBadgesBinding(),
        InProgressBadgesBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const BadgesPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.prizesOnboardingPage,
      binding: WalkthroughBinding(),
      page: () => _mediaQueryWrapper(
        const PrizesOnboardingPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.yourDiaryPage,
      bindings: [
        YourDiaryBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const YourDiaryPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// InfoPage
    GetPage(
      name: Routes.infoPage,
      bindings: [
        InfoBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const InfoPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// InfoDropdownResultsPage
    GetPage(
      name: Routes.infoDropdownResultsPage,
      bindings: [
        InfoDropdownResultBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const InfoDropDownResultsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// InfoDropdownResultsPage
    GetPage(
      name: Routes.tutorEmailPage,
      bindings: [
        TutorEmailBinding(),
      ],
      page: () => _mediaQueryWrapper(
        authNeeded: false,
        const TutorEmailPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// InfoDropdownResultsPage
    GetPage(
      name: Routes.loadCode,
      bindings: [
        LoadCodeBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const LoadCodePage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// LoadCodeResultsPage
    GetPage(
      name: Routes.loadCodeResultsPage,
      binding: LoadCodeResultBinding(),
      page: () => _mediaQueryWrapper(
        const LoadCodeResultsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// MissionsPage
    GetPage(
      name: Routes.missionsPage,
      bindings: [
        MissionsBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const MissionsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// Mission completed
    GetPage(
      name: Routes.missionCompleted,
      binding: MissionCompletedBinding(),
      page: () => _mediaQueryWrapper(
        const MissionCompletedPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// MissionsPage
    GetPage(
      name: Routes.yourCoinsPage,
      page: () => _mediaQueryWrapper(
        const YourCoinsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// MissionsDetailsPage
    GetPage(
      name: Routes.missionsDetailsPage,
      bindings: [
        MissionsDetailsBinding(),
      ],
      page: () => _mediaQueryWrapper(
        const MissionsDetailsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// InviteFriendPage
    GetPage(
      binding: InviteFriendBinding(),
      name: Routes.inviteFriendPage,
      page: () => _mediaQueryWrapper(
        const InviteFriendPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// SurveysPage
    GetPage(
      name: Routes.surveysPage,
      binding: SurveyBinding(),
      page: () => _mediaQueryWrapper(
        const SurveysPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// HistoryPage
    GetPage(
      name: Routes.historyPage,
      binding: HistoryBinding(),
      page: () => _mediaQueryWrapper(
        const HistoryPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// ChartsAndStaticsPage
    GetPage(
      name: Routes.chartsAndStaticsPage,
      binding: ChartsAndStatisticsBindings(),
      page: () => _mediaQueryWrapper(
        const ChartsAndStaticsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// YourMensesStatsPage
    GetPage(
      name: Routes.yourMensesStatsPage,
      binding: YourMensesStatsBinding(),
      page: () => _mediaQueryWrapper(
        const YourMensesStatsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// SettingsPage
    GetPage(
      name: Routes.settings,
      binding: SettingsBinding(),
      page: () => _mediaQueryWrapper(
        const SettingsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// SpecificMensesStatsPage
    GetPage(
      name: Routes.specificMensesStats,
      binding: SpecificMensesStatsBinding(),
      page: () => _mediaQueryWrapper(
        const SpecificMensesStatsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// TamagochiWebView
    GetPage(
      name: Routes.tamagochiWebView,
      page: () {
        final String sessionToken = Get.arguments['sessionToken'];

        return _mediaQueryWrapper(
          TamagochiWebView(
            sessionToken: sessionToken,
          ),
        );
      },
      transition: Transition.rightToLeft,
    ),

    /// CustomizeCherryWebView
    GetPage(
      name: Routes.customizeCherryWebView,
      page: () {
        final String? sessionToken = Get.arguments['sessionToken'];

        return _mediaQueryWrapper(
          CustomizeCherryWebView(
            sessionToken: sessionToken ?? '',
          ),
        );
      },
      transition: Transition.rightToLeft,
    ),

    /// ConfirmTutorEmailPage
    GetPage(
      name: Routes.confirmTutorEmail,
      binding: ConfirmTutorEmailBinding(),
      page: () => _mediaQueryWrapper(
        authNeeded: false,
        const ConfirmTutorEmailPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// ChangePasswordPage
    GetPage(
      name: Routes.changePassword,
      binding: ChangePasswordBinding(),
      page: () => _mediaQueryWrapper(
        authNeeded: false,
        const ChangePasswordPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// Privacy details
    GetPage(
      name: Routes.privacyDetails,
      binding: PrivacyDetailsBinding(),
      page: () => _mediaQueryWrapper(
        authNeeded: false,
        const PrivacyDetailsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// Consents
    GetPage(
      name: Routes.consents,
      binding: ConsentsBinding(),
      page: () => _mediaQueryWrapper(
        authNeeded: false,
        const ConsentsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// Cookies/Fingerprinting
    GetPage(
      name: Routes.cookiesFingerprinting,
      binding: CookiesFingerprintingBinding(),
      page: () => _mediaQueryWrapper(
        authNeeded: false,
        const CookiesFingerprintingPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    /// Dettaglo dati diario
    GetPage(
      name: Routes.diaryDataDetails,
      binding: DiaryDataDetailsBinding(),
      page: () => _mediaQueryWrapper(
        authNeeded: false,
        const DiaryDataDetailsPage(),
      ),
      transition: Transition.rightToLeft,
    ),

    // Edit cookie
    GetPage(
      name: Routes.editCookies,
      page: () => _mediaQueryWrapper(
        const EditCookiesPage(),
        authNeeded: false,
      ),
      transition: Transition.rightToLeft,
    ),

    // Accept consent
    GetPage(
      name: Routes.acceptConsent,
      binding: AcceptConsentBinding(),
      page: () => _mediaQueryWrapper(
        const AcceptConsentPage(),
        authNeeded: false,
      ),
      transition: Transition.downToUp,
    ),
  ];

  /// Private methods

  static Widget _mediaQueryWrapper(
    Widget view, {
    bool authNeeded = true,
  }) {
    return WrapperAccessWidget(
      authNeeded: authNeeded,
      child: view,
    );
  }
}
