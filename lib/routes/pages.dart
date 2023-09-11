import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import 'routes.dart';

class Pages {
  Pages._(); // this is to prevent anyone from instantiating this object

  static final List<GetPage<Pages>> pages = [
    GetPage(
      binding: SplashBinding(),
      name: Routes.splash,
      page: () => _mediaQueryWrapper(const SplashPage()),
      transition: Transition.fade,
    ),
  ];

  /// Private methods

  static MediaQuery _mediaQueryWrapper(GetView view) {
    return MediaQuery(
      data: MediaQuery.of(Get.context!).copyWith(textScaleFactor: 1),
      child: view,
    );
  }
}
