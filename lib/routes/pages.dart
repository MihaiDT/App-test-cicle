import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/main/main_binding.dart';
import '../modules/main/main_page.dart';
import '../modules/signin/signin_binding.dart';
import '../modules/signin/signin_page.dart';
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
      page: () => const MainPage(),
      transition: Transition.fadeIn,
    ),

    // Signin
    GetPage(
      binding: SigninBinding(),
      name: Routes.signin,
      page: () => const SigninPage(),
      transition: Transition.rightToLeft,
    ),

    // Splash
    GetPage(
      binding: SplashBinding(),
      name: Routes.splash,
      page: () => const SplashPage(),
      transition: Transition.fade,
    ),

    // Walkthrough
    GetPage(
      binding: WalkthroughBinding(),
      name: Routes.walkthrough,
      page: () => const WalkthroughPage(),
      transition: Transition.fade,
    ),
  ];
}
