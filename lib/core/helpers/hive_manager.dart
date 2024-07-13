import 'package:hive/hive.dart';
import 'package:lines/core/utils/helpers.dart';

class HiveManager {
  HiveManager._();

  static final HiveManager _instance = HiveManager._();

  factory HiveManager() {
    return _instance;
  }

  static bool get showLockPage {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.appHidden.name) ?? false;
  }

  static set showLockPage(bool symbol) {
    Hive.box(hiveBoxName).put(HiveReferenceKeys.appHidden.name, symbol);
  }

  static bool get firstAccess {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.isFirstAccess.name) ?? true;
  }

  static set firstAccess(bool symbol) {
    Hive.box(hiveBoxName).put(HiveReferenceKeys.isFirstAccess.name, symbol);
  }

  static String get userId {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.userId.name) ?? "";
  }

  static set userId(String userId) {
    Hive.box(hiveBoxName).put(HiveReferenceKeys.userId.name, userId);
  }

  static void removeUserId() {
    Hive.box(hiveBoxName).delete(HiveReferenceKeys.userId.name);
  }

  static int get welcomeSurveyTotalAccess {
    final accessKeys =
        Hive.box(hiveBoxName).get(HiveReferenceKeys.welcomeSurveyNumberOfAccess.name) ?? Map<String, int>.from({});

    return accessKeys.keys.length;
  }

  static int get welcomeSurveyNumberOfAccess {
    final accessKeys =
        Hive.box(hiveBoxName).get(HiveReferenceKeys.welcomeSurveyNumberOfAccess.name) ?? Map<String, int>.from({});

    final todayKey = dateFormatYMD.format(DateTime.now());
    return accessKeys[todayKey] ?? 0;
  }

  static set welcomeSurveyNumberOfAccess(int numberOfAccess) {
    final accessKeys =
        Hive.box(hiveBoxName).get(HiveReferenceKeys.welcomeSurveyNumberOfAccess.name) ?? Map<String, int>.from({});

    if (accessKeys.keys.length >= 3) {
      return;
    }

    final todayKey = dateFormatYMD.format(DateTime.now());
    accessKeys[todayKey] = numberOfAccess;

    Hive.box(hiveBoxName).put(HiveReferenceKeys.welcomeSurveyNumberOfAccess.name, accessKeys);
  }

  static bool get isFirstTutorialWatched {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.isFirstTutorialWatched.name) ?? false;
  }

  static set isFirstTutorialWatched(bool isFirstTutorialWatched) {
    Hive.box(hiveBoxName).put(
      HiveReferenceKeys.isFirstTutorialWatched.name,
      isFirstTutorialWatched,
    );
  }

  static bool get showSecondTutorialAccess {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.showSecondTutorialAccess.name) ?? true;
  }

  static set showSecondTutorialAccess(bool showSecondTutorialAccess) {
    Hive.box(hiveBoxName).put(
      HiveReferenceKeys.showSecondTutorialAccess.name,
      showSecondTutorialAccess,
    );
  }

  static bool? get hasAcceptedCookieProfiling {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.hasAcceptedCookieProfiling.name);
  }

  static set hasAcceptedCookieProfiling(bool? hasAcceptedCookie) {
    Hive.box(hiveBoxName).put(
      HiveReferenceKeys.hasAcceptedCookieProfiling.name,
      hasAcceptedCookie,
    );
  }

  static bool? get hasAcceptedCookieStats {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.hasAcceptedCookieStats.name);
  }

  static set hasAcceptedCookieStats(bool? hasAcceptedCookie) {
    Hive.box(hiveBoxName).put(HiveReferenceKeys.hasAcceptedCookieStats.name, hasAcceptedCookie);
  }

  static bool get hasAcceptedCookie {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.hasAcceptedCookieProfiling.name) != null &&
        Hive.box(hiveBoxName).get(HiveReferenceKeys.hasAcceptedCookieStats.name) != null;
  }

  static bool get showSurveyTutorial {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.showSurveyTutorial.name) ?? false;
  }

  static set showSurveyTutorial(bool showSurveyTutorial) {
    Hive.box(hiveBoxName).put(
      HiveReferenceKeys.showSurveyTutorial.name,
      showSurveyTutorial,
    );
  }

  static void removeAcceptedCookie() {
    Hive.box(hiveBoxName).delete(HiveReferenceKeys.hasAcceptedCookieProfiling.name);
    Hive.box(hiveBoxName).delete(HiveReferenceKeys.hasAcceptedCookieStats.name);
  }

  static bool get isPastDateCalculated {
    return Hive.box(hiveBoxName).get(HiveReferenceKeys.isPastDateCalculated.name) ?? false;
  }

  static set isPastDateCalculated(bool isFirstTutorialWatched) {
    Hive.box(hiveBoxName).put(
      HiveReferenceKeys.isPastDateCalculated.name,
      isFirstTutorialWatched,
    );
  }

  static void removeIsPastDateCalculated() {
    Hive.box(hiveBoxName).delete(HiveReferenceKeys.isPastDateCalculated.name);
  }
}

const String hiveBoxName = "linesApp";

enum HiveReferenceKeys {
  appHidden,
  isFirstAccess,
  userId,
  savedSymptoms,
  isFirstTutorialWatched,
  hasAcceptedCookieProfiling,
  hasAcceptedCookieStats,
  isPastDateCalculated,
  welcomeSurveyNumberOfAccess,
  showSecondTutorialAccess,
  showSurveyTutorial;
}
