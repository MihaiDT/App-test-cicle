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
}

enum HiveReferenceKeys {
  appHidden,
  isFirstAccess,
  userId,
  savedSymptoms,
  isFirstTutorialWatched,
  numberOfAccess;
}
