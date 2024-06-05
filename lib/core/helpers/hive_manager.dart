import 'package:hive/hive.dart';

class HiveManager {
  HiveManager._();

  static final HiveManager _instance = HiveManager._();

  factory HiveManager() {
    return _instance;
  }

  static bool get showLockPage {
    return Hive.box("linesApp").get(HiveReferenceKeys.appHidden.name) ?? false;
  }

  static set showLockPage(bool symbol) {
    Hive.box("linesApp").put(HiveReferenceKeys.appHidden.name, symbol);
  }

  static bool get firstAccess {
    return Hive.box("linesApp").get(HiveReferenceKeys.isFirstAccess.name) ??
        true;
  }

  static set firstAccess(bool symbol) {
    Hive.box("linesApp").put(HiveReferenceKeys.isFirstAccess.name, symbol);
  }

  static String get userId {
    return Hive.box("linesApp").get(HiveReferenceKeys.userId.name) ?? "";
  }

  static set userId(String userId) {
    Hive.box("linesApp").put(HiveReferenceKeys.userId.name, userId);
  }

  static void removeUserId() {
    Hive.box("linesApp").delete(HiveReferenceKeys.userId.name);
  }

  static int get numberOfAccess {
    return Hive.box("linesApp").get(HiveReferenceKeys.numberOfAccess.name) ?? 1;
  }

  static set numberOfAccess(int numberOfAccess) {
    Hive.box("linesApp")
        .put(HiveReferenceKeys.numberOfAccess.name, numberOfAccess);
  }

  static bool get isFirstTutorialWatched {
    return Hive.box("linesApp")
            .get(HiveReferenceKeys.isFirstTutorialWatched.name) ??
        false;
  }

  static set isFirstTutorialWatched(bool isFirstTutorialWatched) {
    Hive.box("linesApp").put(
      HiveReferenceKeys.isFirstTutorialWatched.name,
      isFirstTutorialWatched,
    );
  }

  static bool get hasAcceptedCookieProfiling {
    return Hive.box("linesApp")
            .get(HiveReferenceKeys.hasAcceptedCookieProfiling.name) ??
        false;
  }

  static bool get hasAcceptedCookieStats {
    return Hive.box("linesApp")
            .get(HiveReferenceKeys.hasAcceptedCookieStats.name) ??
        false;
  }

  static set hasAcceptedCookieStats(bool hasAcceptedCookie) {
    Hive.box("linesApp")
        .put(HiveReferenceKeys.hasAcceptedCookieStats.name, hasAcceptedCookie);
  }

  static set hasAcceptedCookieProfiling(bool hasAcceptedCookie) {
    Hive.box("linesApp").put(
        HiveReferenceKeys.hasAcceptedCookieProfiling.name, hasAcceptedCookie);
  }

  static bool get hasAcceptedCookie {
    return Hive.box("linesApp")
                .get(HiveReferenceKeys.hasAcceptedCookieProfiling.name) !=
            null &&
        Hive.box("linesApp")
                .get(HiveReferenceKeys.hasAcceptedCookieStats.name) !=
            null;
  }

  static void removeAcceptedCookie() {
    Hive.box("linesApp")
        .delete(HiveReferenceKeys.hasAcceptedCookieProfiling.name);
    Hive.box("linesApp").delete(HiveReferenceKeys.hasAcceptedCookieStats.name);
  }

  static bool get isPastDateCalculated {
    return Hive.box("linesApp")
            .get(HiveReferenceKeys.isPastDateCalculated.name) ??
        false;
  }

  static set isPastDateCalculated(bool isFirstTutorialWatched) {
    Hive.box("linesApp").put(
      HiveReferenceKeys.isPastDateCalculated.name,
      isFirstTutorialWatched,
    );
  }

  static void removeIsPastDateCalculated() {
    Hive.box("linesApp").delete(HiveReferenceKeys.isPastDateCalculated.name);
  }
}

enum HiveReferenceKeys {
  appHidden,
  isFirstAccess,
  userId,
  savedSymptoms,
  isFirstTutorialWatched,
  hasAcceptedCookieProfiling,
  hasAcceptedCookieStats,
  isPastDateCalculated,
  numberOfAccess;
}
