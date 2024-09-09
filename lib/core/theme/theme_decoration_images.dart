import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class ThemeDecorationImage {
  DecorationImage get bgDark => const DecorationImage(
        image: AssetImage(ThemeImage.bgDark),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );

  DecorationImage get bgLight => const DecorationImage(
        image: AssetImage(ThemeImage.bgLight),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );

  DecorationImage get bgLightLarge => const DecorationImage(
        image: AssetImage(ThemeImage.bgLightLarge),
        fit: BoxFit.cover,
        alignment: Alignment.topLeft,
      );

  DecorationImage get bgMainBottomNavigationBar => const DecorationImage(
        image: AssetImage(ThemeImage.bgMainBottomNavigationBar),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );

  DecorationImage get bgGradientLightPink => const DecorationImage(
        image: AssetImage(ThemeImage.bgWalkthrough),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );

  DecorationImage get bgHomeAvatarContainer => const DecorationImage(
        image: AssetImage(ThemeImage.homeAvatarContainerBg),
        fit: BoxFit.cover,
        alignment: Alignment.center,
      );

  DecorationImage get bgQuestionMark => const DecorationImage(
        image: AssetImage(ThemeImage.quizBackgroundQuestionmark),
        fit: BoxFit.cover,
        alignment: Alignment.center,
      );

  DecorationImage get bgCalendar => const DecorationImage(
        image: AssetImage(ThemeImage.bgCalendar),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );
}
