import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class ThemeDecorationImage {
  DecorationImage get bgDark => DecorationImage(
        image: AssetImage(ThemeImage.bgDark),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );

  DecorationImage get bgLight => DecorationImage(
        image: AssetImage(ThemeImage.bgLight),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );

  DecorationImage get bgLightLarge => DecorationImage(
        image: AssetImage(ThemeImage.bgLightLarge),
        fit: BoxFit.cover,
        alignment: Alignment.topLeft,
      );

  DecorationImage get bgMainBottomNavigationBar => DecorationImage(
        image: AssetImage(ThemeImage.bgMainBottomNavigationBar),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );

  DecorationImage get bgWalkthrough => DecorationImage(
        image: AssetImage(ThemeImage.bgWalkthrough),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );

  DecorationImage get bgHomeAvatarContainer => DecorationImage(
        image: AssetImage(ThemeImage.homeAvatarContainerBg),
        fit: BoxFit.cover,
        alignment: Alignment.center,
      );

  DecorationImage get bgQuestionMark => DecorationImage(
        image: AssetImage(ThemeImage.quizBackgroundQuestionmark),
        fit: BoxFit.cover,
        alignment: Alignment.center,
      );

  DecorationImage get bgCalendar => DecorationImage(
        image: AssetImage(ThemeImage.bgCalendar),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );
}
